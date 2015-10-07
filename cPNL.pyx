##from libc.stdlib cimport malloc, free
from libcpp cimport bool
from operator import mul
from libcpp.string cimport string
from cpython.string cimport PyString_AsString
import copy
import csv
from collections import Counter
import re
##import cython
##cdef char ** to_cstring_array(list_str):
##    cdef char **ret = <char **>malloc(len(list_str) * sizeof(char *))
##    for i in xrange(len(list_str)):
##        ret[i] = PyString_AsString(list_str[i])
##    return ret



cdef extern from "pnlHigh.hpp":
    cdef cppclass WDistribFun:
        pass
    
    cdef cppclass WGraph:
        pass
    
    cdef cppclass TokenCover:
        pass
    
    cdef cppclass WDistributions:
        pass
    
    cdef cppclass NetCallback:
        pass

    cdef cppclass Tok:
        float FltValue()
        
    cdef cppclass TokArr:
        TokArr() except +
        TokArr(const Tok&)
        TokArr(const Tok[], int _len)
        TokArr(const float[], int _len)
        TokArr(const int[], int _len)
        TokArr(const string[], int _len)
        TokArr(const char * const[], int _len)
        TokArr(const char *)
        TokArr(const string&)
#        const Tok& operator[](int) const
        Tok& operator[](int)
        TokArr operator[](const Tok&) const
#        operator String() const
        
    cdef cppclass BayesNet:
        BayesNet() except +
        void AddNode(char*  nodes, char* subnodes)
        void AddNode(char*  nodes)
        void DelNode(char* nodes)
        TokArr GetNodeType(char* nodes)
        void AddArc(char*, char*)
        void DelArc(char*, char*)
        TokArr GetNeighbors(char* nodes)
        TokArr GetParents(char* nodes)
        TokArr GetChildren(char* nodes)
        void SetPTabular(char* value, char* prob, char* parentValue )
        void SetPTabular(char* value, char* prob )
        TokArr GetPTabular(char* value, char* parents )
        TokArr GetPTabular(char* value)
        void SetPGaussian(char* node, char* mean, char* variance, char* weight , char* tabParentValue)
        void SetPGaussian(char* node, char* mean, char* variance, char* weight)
        void SetPGaussian(char* node, char* mean, char* variance)
        void SetPSoftMax(char* node, char* weigth, char* offset, char* parentValue)
        void SetPSoftMax(char* node, char* weigth, char* offset)
        TokArr GetSoftMaxOffset(char* node, char* parent)
        TokArr GetSoftMaxOffset(char* node)
        TokArr GetSoftMaxWeights(char* node, char* parent)
        TokArr GetSoftMaxWeights(char* node)
        void EditEvidence(char* values)
        void ClearEvid()
        float GetCurEvidenceLogLik()
        TokArr GetEvidBufLogLik()
        void CurEvidToBuf()
        void AddEvidToBuf(string values)
        void ClearEvidBuf()
        void LearnParameters(char* aValue[], int nValue)
        void LearnParameters(char* aValue[])
        void LearnParameters()
        void LearnStructure(char* aValue[], int nValue)
        void LearnStructure(char* aValue[])
        void LearnStructure()
        float GetEMLearningCriterionValue()
        TokArr GetMPE(char* nodes)
        TokArr GetJPD(char* nodes)
        TokArr GetGaussianMean(char* node, char* tabParentValue)
        TokArr GetGaussianMean(char* node)
        TokArr GetGaussianCovar(char* node, char* tabParentValue)
        TokArr GetGaussianCovar(char* node)
        TokArr GetGaussianWeights(char* node, char* parent, char* tabParentValue)
        TokArr GetGaussianWeights(char* node, char* parent)
        void SaveNet(const char *filename)
#        int SaveEvidBuf(const char *filename, NetConst::ESavingType mode )
        int SaveEvidBuf(const char *filename)
        void LoadNet(const char *filename)
#        int LoadEvidBuf(const char *filename, NetConst::ESavingType mode , char* columns)
#        int LoadEvidBuf(const char *filename, NetConst::ESavingType mode )
        int LoadEvidBuf(const char *filename)
        void GenerateEvidences( int nSample, bool ignoreCurrEvid, char* whatNodes )
        void GenerateEvidences( int nSample, bool ignoreCurrEvid)
        void GenerateEvidences( int nSample)
        void MaskEvidBuf(char* whatNodes )
        void MaskEvidBuf()
        void SetProperty(const char *name, const char *value)
        string GetProperty(const char *name) const
        

        
cdef extern from "console.hpp":
    pass
    
cdef extern from "pnl_dll.hpp":
    pass

cdef extern from "<iostream>" namespace "std":
    pass

cdef extern from "<string>":
    cppString String(TokArr)
    cdef cppclass cppString:
        string c_str()

cdef extern from "<time.h>":
    pass


class Node:
    pass

def combinLists(originalList,attrType):
    floatList=[]
    for i in originalList:
        itype=type(i)
        if itype==int or itype==float:
            floatList.append(float(i))
        elif itype==list or itype==tuple:
            floatList=floatList+combinLists(i,attrType)
        else:
            raise TypeError("invalid type found in '%s': '%s'" % (attrType,str(itype)))
    return floatList
        
cdef class PyBayesNet:
    cdef BayesNet net 
    nodes = {}
    cdef char* nodeType
    setProperty = Node()
    __netAttribute={}
    def __init__(self,nodeType="continuous"):
        self.nodeType = PyString_AsString(nodeType)
        self.__netAttribute["evidence"]= {}
        self.__netAttribute["target"]= None
        self.__netAttribute["features"] = None
        self.__netAttribute["allowedstructureLearnmMthods"]=["MaxLh","PreAs", "MarLh"]
        self.__netAttribute["allowedstructureLearnmScoreFuns"]=["BIC","AIC","WithoutPenalty"]
        self.__netAttribute["allowedstructureLearnmPrior"]=["Dirichlet","K2","BDeu"]
        self.setProperty.emLearn = lambda tolerance=None,maxNumberOfIterations=None:self.emLearn(tolerance,maxNumberOfIterations)
        self.setProperty.bayesLearn = lambda:self.bayesLearn()
        self.setProperty.gibsInferance = lambda numStreams=None,thresholdIteration=None,numberOfIterations=None:self.gibsInferance(numStreams,thresholdIteration,numberOfIterations)
        self.setProperty.pearlInferance = lambda tolerance=None,maxNumberOfIterations=None:self.pearlInferance(tolerance,maxNumberOfIterations)
        self.setProperty.jtreeInferance = lambda :self.jtreeInferance()
        self.setProperty.naiveInferance = lambda :self.naiveInferance()
##        self.setProperty.structureLearn = lambda method=None,scoreFun=None,prior=None,initialPrior=None:self.structureLearn(method,scoreFun,prior,initialPrior)
##        self.setProperty.structureLearnMethod = lambda algo:self.structureLearnMethod(algo)
##        self.setProperty.structureLearnScoreFun = lambda algo:self.structureLearnScoreFun(algo)
##        self.setProperty.structureLearnPrior = lambda algo,prior:self.structureLearnPrior(algo,prior)
##
##        
##    
    cdef emLearn(self,tolerance,maxNumberOfIterations):
        if not tolerance==None:
            if not type(tolerance)==float:
                raise TypeError("Expected floating point value for Tolerance got '%s'" % type(tolerance))
            self.net.SetProperty(PyString_AsString("EMTolerance"),PyString_AsString(str(tolerance)))
        if not maxNumberOfIterations==None:
            if not type(maxNumberOfIterations)==int:
                raise TypeError("Expected int value for MaxNumberOfIterations got '%s'" % type(maxNumberOfIterations))
            if maxNumberOfIterations<=0:
                raise ValueError("Needs positive integer grater than zero")
            self.net.SetProperty(PyString_AsString("EMMaxNumberOfIterations"),PyString_AsString(str(maxNumberOfIterations)))
        self.net.SetProperty(PyString_AsString("Learning"),PyString_AsString("em"))
    
    cdef bayesLearn(self):
        self.net.SetProperty(PyString_AsString("Learning"),PyString_AsString("bayes"))

    cdef gibsInferance(self,numStreams,thresholdIteration,numberOfIterations):
        if not numStreams==None:
            if not type(numStreams)==int:
                raise TypeError("Expected int value for NumberOfStreams got '%s'" % type(numStreams))
            if numStreams<=0:
                raise ValueError("Number of streams needs to be positive integer grater than zero")
            self.net.SetProperty(PyString_AsString("GibbsNumberOfStreams"),PyString_AsString(str(numStreams)))
        if not thresholdIteration==None:
            if not type(thresholdIteration)==int:
                raise TypeError("Expected int value for ThresholdIteration got '%s'" % type(thresholdIteration))
            if thresholdIteration<=0:
                raise ValueError("Threshold iteration needs to be positive integer grater than zero")
            self.net.SetProperty(PyString_AsString("GibbsThresholdIteration"),PyString_AsString(str(thresholdIteration)))
        if not numberOfIterations==None:
            if not type(numberOfIterations)==int:
                raise TypeError("Expected int value for `NumberOfIterations` got '%s'" % type(numberOfIterations))
            if numberOfIterations<=0:
                raise ValueError("Number of iterations needs to be positive integer grater than zero")
            self.net.SetProperty(PyString_AsString("GibbsNumberOfIterations"),PyString_AsString(str(numberOfIterations)))
        self.net.SetProperty(PyString_AsString("Inference"),PyString_AsString("gibbs"))


    cdef pearlInferance(self,tolerance,maxNumberOfIterations):
        if not tolerance==None:
            if not type(tolerance)==float:
                raise TypeError("Expected floating point value for Tolerance got '%s'" % type(tolerance))
            self.net.SetProperty(PyString_AsString("PearlTolerance"),PyString_AsString(str(tolerance)))
        if not maxNumberOfIterations==None:
            if not type(maxNumberOfIterations)==int:
                raise TypeError("Expected int value for MaxNumberOfIterations got '%s'" % type(maxNumberOfIterations))
            if maxNumberOfIterations<=0:
                raise ValueError("Needs positive integer grater than zero")
            self.net.SetProperty(PyString_AsString("PearlMaxNumberOfIterations"),PyString_AsString(str(maxNumberOfIterations)))
        self.net.SetProperty(PyString_AsString("Inference"),PyString_AsString("pearl"))

    cdef jtreeInferance(self):
        self.net.SetProperty(PyString_AsString("Inference"),PyString_AsString("jtree"))

    cdef naiveInferance(self):
        self.net.SetProperty(PyString_AsString("Inference"),PyString_AsString("naive"))

##    cdef structureLearn(self,method,scoreFun,prior,initialPrior):
##        if method:
##            self.structureLearnMethod(method)
##        if scoreFun:
##            self.structureLearnScoreFun(scoreFun)
##        if prior:
##            if initialPrior:
##                self.structureLearnPrior(prior,initialPrior)
##            else:
##                self.structureLearnPrior(prior)
##           
##    cdef structureLearnMethod(self,str algo):
##        if not algo in self.__netAttribute["allowedstructureLearnmMthods"]:
##            raise ValueError("Allowed algorithms for method are '%s'" % "','".join(self.__netAttribute["allowedstructureLearnmMthods"]))
##        self.net.SetProperty(PyString_AsString("LearningStructureMethod"),PyString_AsString(algo))
##    
##    cdef structureLearnScoreFun(self,str algo):
##        if not algo in self.__netAttribute["allowedstructureLearnmScoreFuns"]:
##            raise ValueError("Allowed score function algorithms are '%s'" % "','".join(self.__netAttribute["allowedstructureLearnmScoreFuns"]))
##        self.net.SetProperty(PyString_AsString("LearningStructureMethod"),PyString_AsString(algo))
##    
##    cdef structureLearnPrior(self,str algo,int val=0):
##        if not algo in self.__netAttribute["allowedstructureLearnmPrior"]:
##            raise ValueError("Allowed algorithms for Prior calculation are '%s'" % "','".join(self.__netAttribute["allowedstructureLearnmPrior"]))
##        if algo=="K2" and val<0:
##            raise ValueError("initial prior value should be a positive intiger and zero allowed")
##        self.net.SetProperty(PyString_AsString("LearningStructureK2PriorVal"),PyString_AsString(str(val)))
##        self.net.SetProperty(PyString_AsString("LearningStructureMethod"),PyString_AsString(algo))
##
##        
##
    def create_network(self,dict network_struct,str casefile=""):
        nodes=[]
        nodesWithParent=[]
        for node in network_struct:
            if "parents" in network_struct[node]:
                nodesWithParent.append(node)
                dType=type(network_struct[node]["parents"])
                if dType==str or dType==unicode:
                    network_struct[node]["parents"]=[str(network_struct[node]["parents"])]
                elif dType==list or dType==tuple or dType==set:
                    parents=network_struct[node]["parents"]
                    network_struct[node]["parents"]=[]
                    for pnode in parents:
                        dType = type(pnode)
                        if dType==str or dType==unicode:
                            network_struct[node]["parents"].append(str(pnode))
                        else:
                            raise TypeError("parent names should be list of strings. Found: '%s'" % dType)
                else:
                    raise TypeError("parent names should be list of strings")
            else:
                network_struct[node]["parents"]=None
                nodes.append(node)
            if not "states" in network_struct[node]:
                network_struct[node]["states"]=["dim1"]
            elif type(network_struct[node]["states"])==str or type(network_struct[node]["states"])==unicode:
                network_struct[node]["states"]=[str(network_struct[node]["states"])]
            else:
                network_struct[node]["states"]=[str(state) for state in network_struct[node]["states"]]
      
        while nodesWithParent:
            leftoutNodes=[]
            for node in nodesWithParent:
                if not set(network_struct[node]["parents"])-set(nodes):
                    nodes.append(node)
                else:
                    leftoutNodes.append(node)
            if len(leftoutNodes)==len(nodesWithParent):
                raise TypeError("Network has cycles hence can't be topologically sorted")
            nodesWithParent=leftoutNodes
        for node in nodes:
            self.createNode(node,list(network_struct[node]["states"]))
            if network_struct[node]["parents"]:
                self.createEdge(network_struct[node]["parents"],node)
                if "means" in network_struct[node] and "variances" in network_struct[node] and "weights" in network_struct[node]:
                    self.setGaussianParams(node,
                                           network_struct[node]["means"],
                                           network_struct[node]["variances"],
                                           network_struct[node]["weights"],
                                           network_struct[node]["tabParentValues"] if "tabParentValues" in network_struct[node] else None)
            if "means" in network_struct[node] and "variances" in network_struct[node]:
                self.setGaussianParams(node,
                                       network_struct[node]["means"],
                                       network_struct[node]["variances"],
                                       None,
                                       network_struct[node]["tabParentValues"] if "tabParentValues" in network_struct[node] else None)
                        
        if casefile.strip():
            self.net.LoadEvidBuf(PyString_AsString(casefile.strip()))
            self.net.LearnParameters()
            
         

    def setEvidence(self,observation):
        new_observation={}
        for node in observation:
            if not node in self.nodes:
                raise ValueError("node name '%s' doesn't exist" % node)
            dType=type(observation[node])
            if (dType==int or dType==float) and len(self.nodes[node]["states"])==1:
                observation[node]=((self.nodes[node]["states"],observation[node]),)
            
            if (dType==tuple or dType==list) and len(observation[node])==2 and type(observation[node][0])==str:
                observation[node]=(observation[node],)
                
            for stateAndObsv in observation[node]:
                if not stateAndObsv[0] in self.nodes[node]["states"]:
                    raise ValueError("There is no state called '%s' for node '%s' " % (stateAndObsv[0],node))
                try:         
                    new_observation[(node,stateAndObsv[0])]=float(stateAndObsv[1])
                except:
                    raise TypeError("Invalid structure")                
        if self.__netAttribute["evidence"]:
            self.net.ClearEvid()
        self.__netAttribute["evidence"]=new_observation
        if self.__netAttribute["evidence"]:
            self.net.EditEvidence(PyString_AsString(" ".join([j[0]+"^"+j[1]+"^"+str(self.__netAttribute["evidence"][j]) for j in self.__netAttribute["evidence"]])))

    def getMean(self,node):
        cdef TokArr resp
        if hasattr(node, 'getNodeName'):
            node=node.getNodeName()
        if not node in self.nodes:
            raise ValueError("Node name specifide ('%s') is not created yet" % node)
        resp = self.net.GetGaussianMean(PyString_AsString(node))
        res = [float(i) for i in String(resp).c_str().split("^")]            
        return {self.nodes[node]["states"][i]:res[i] for i in range(len(self.nodes[node]["states"]))}

    def getCover(self,node):
        cdef TokArr resp
        if hasattr(node, 'getNodeName'):
            node=node.getNodeName()
        if not node in self.nodes:
            raise ValueError("Node name specifide ('%s') is not created yet" % node)
        resp=self.net.GetGaussianCovar(PyString_AsString(node))
        res=[float(i) for i in String(resp).c_str().split("^")]
        numStates=len(self.nodes[node]["states"])
        return tuple([tuple(res[i*numStates:(i+1)*numStates]) for i in range(numStates)])

    
    def getWeights(self,node,parent):
        cdef TokArr resp
        if hasattr(node, 'getNodeName'):
            node=node.getNodeName()
        if not node in self.nodes:
            raise ValueError("Node name specifide ('%s') is not created yet" % node)
        if hasattr(parent, 'getNodeName'):
            parent=parent.getNodeName()
        if not parent in self.nodes:
            raise ValueError("Node name specifide ('%s') is not created yet" % parent)
        resp=self.net.GetGaussianWeights(PyString_AsString(node),PyString_AsString(parent))
        res=[float(i) for i in String(resp).c_str().split("^")]
        numStates=len(self.nodes[node]["states"])
        numPStates=len(self.nodes[parent]["states"])
        return tuple([tuple(res[i*numStates:(i+1)*numStates]) for i in range(numPStates)])
    

    def getJPD(self,node,*parents):
        cdef TokArr resp
        nodes=((node,)+parents)
        nodeNames=[]
        for node in nodes:
            if hasattr(node, 'getNodeName'):
                node=node.getNodeName()
            if not node in self.nodes:
                raise ValueError("Node name specifide ('%s') is not created yet" % node)
            nodeNames.append(node)
        resp = self.net.GetJPD(PyString_AsString(" ".join(nodeNames)))
        res=[[j for j in i.split("^")] for i in String(resp).c_str().split(" ")]
        variance=[]
        numMeans=len(res[0])
        return {
                "mean":[float(i) for i in res[0]],
                "variance":[[float(res[1][j]) for j in range(i*numMeans,(i+1)*numMeans)] for i in range(numMeans)]
                }

    def getMPE(self,node,*parents):
        cdef TokArr resp
        nodes=((node,)+parents)
        nodeNames=[]
        for node in nodes:
            if hasattr(node, 'getNodeName'):
                node=node.getNodeName()
            if not node in self.nodes:
                raise ValueError("Node name specifide ('%s') is not created yet" % node)
            nodeNames.append(node)
        resp = self.net.GetMPE(PyString_AsString(" ".join(nodeNames)))
        res = String(resp).c_str()
        res=[i.split("^") for i in res.split(" ")]
        result = {}
        for i in range(len(nodeNames)):
            result[nodeNames[i]]={}
            for j in range(len(self.nodes[nodeNames[i]]["states"])):
                result[nodeNames[i]][self.nodes[nodeNames[i]]["states"][j]]=float(res[i][j])
        return result

##    def learnStructure(self,str casefile,str target,tuple features=None):
##        cdef TokArr cppNode
##        if re.compile(r'^[a-zA-Z]([a-zA-Z\-0-9]*[a-zA-Z0-9]+)?$').sub("",target):
##            raise ValueError("Node name shold only consist of alphabets and numbers, it shouldn't stat with numbers")
##        for node in features:
##            if re.compile(r'^[a-zA-Z]([a-zA-Z\-0-9]*[a-zA-Z0-9]+)?$').sub("",node):
##                raise ValueError("Node name shold only consist of alphabets and numbers, it shouldn't stat with numbers")
##        nodes={}
##        with open(casefile) as csvFile:
##            reader=csv.reader(csvFile, dialect=csv.excel)
##            observations=[]
##            for row in reader:
##                header = [cell for cell in row]
##                break
##            if not self.__netAttribute["target"] in header:
##                raise ValueError("Target node name should present in case file to learn structue")
##            for node in features:
##                if not node in header:
##                    raise ValueError("All feature node names should present in case file to learn structue")
##            nodes={i:[] for i in (features+(target))}
##            for row in reader:
##                row_len=len(row)
##                if row_len:
##                    for i in range(row_len):
##                        if header[i] in self.nodes and row[i] and not row[i] in nodes[header[i]]:
##                            nodes[header[i]]=row[i]
##                            if re.compile(r'^[a-zA-Z]([a-zA-Z\-0-9]*[a-zA-Z0-9]+)?$').sub("",row[i]):
##                                raise ValueError("state name shold only consist of alphabets and numbers, it shouldn't stat with numbers: found '%s'",row[i])
##        self.__netAttribute["target"]=target
##        self.__netAttribute["features"]=features
##        if not all(state for state in nodes):
##            raise ValueError("All nodes should have one or more states")
##        for nodeName in nodes:
##            self.createNode(nodeName,tuple(nodes[nodeName]))
##        self.net.LearnStructure()
##        for nodeName in nodes:
##            cppNode = self.net.GetParents(PyString_AsString(nodeName))
##            res=String(cppNode).c_str().strip()
##            if res:
##                for pn in res.split(" "):
##                    self.nodes[nodeName]["parents"].append(pn)
##        
##                
##        
    def setTargetNode(self,target):
        if hasattr(target, 'getNodeName'):
            target=target.getNodeName()
        if not target in self.nodes:
            raise ValueError("Target node name specifide is not created yet")
        self.__netAttribute["target"]=target

##    def evaluate(self,str casefile):
##        if not self.__netAttribute["target"] in self.nodes:
##            raise ValueError("Target node name should be set before evaluating")
##        observations=[]
##        with open(casefile) as csvFile:
##            reader=csv.reader(csvFile, dialect=csv.excel)
##            for row in reader:
##                header = [cell for cell in row]
##                break
##            if not self.__netAttribute["target"] in header:
##                raise ValueError("Target node name should present in case file to evaluate")
##            for row in reader:
##                row_len=len(row)
##                if row_len:
##                    row_observation={}
##                    for i in range(row_len):
##                        if header[i] in self.nodes and row[i] in self.nodes[header[i]]["states"]:
##                            row_observation[header[i]]=row[i]
##                    observations.append(row_observation)
##        if self.__netAttribute["evidence"]:
##            self.net.ClearEvid()
##        prediction=Counter()
##        for evidence in observations:
##            self.net.EditEvidence(PyString_AsString(" ".join([node+"^"+evidence[node] for node in evidence if not node==self.__netAttribute["target"]])))
##            actualState=evidence[self.__netAttribute["target"]] if self.__netAttribute["target"] in evidence else ''
##            prediction[(actualState,self.getMPE(self.__netAttribute["target"]).values()[0])]+=1
##            self.net.ClearEvid()
##        if self.__netAttribute["evidence"]:
##            self.net.EditEvidence(PyString_AsString(" ".join([node+"^"+self.__netAttribute["evidence"][node] for node in self.__netAttribute["evidence"]])))
##        correctpred=0
##        for act,pred in prediction:
##            if act==pred:
##                correctpred+=prediction[(act,pred)]
##        accuracy=float(correctpred)/len(observations)
##        return accuracy,dict(prediction)
##
##    def classify(self,str casefile):
##        if not self.__netAttribute["target"] in self.nodes:
##            raise ValueError("Target node name should be set before evaluating")
##        observations=[]
##        with open(casefile) as csvFile:
##            reader=csv.reader(csvFile, dialect=csv.excel)
##            for row in reader:
##                header = [cell for cell in row]
##                break
##            for row in reader:
##                row_len=len(row)
##                if row_len:
##                    row_observation={}
##                    for i in range(row_len):
##                        if header[i] in self.nodes and row[i] in self.nodes[header[i]]["states"]:
##                            row_observation[header[i]]=row[i]
##                    observations.append(row_observation)
##        if self.__netAttribute["evidence"]:
##            self.net.ClearEvid()
##        for evidence in observations:
##            self.net.EditEvidence(PyString_AsString(" ".join([node+"^"+evidence[node] for node in evidence if not node==self.__netAttribute["target"]])))
##            evidence[self.__netAttribute["target"]]=self.getMPE(self.__netAttribute["target"]).values()[0]
##            self.net.ClearEvid()
##        if self.__netAttribute["evidence"]:
##            self.net.EditEvidence(PyString_AsString(" ".join([node+"^"+self.__netAttribute["evidence"][node] for node in self.__netAttribute["evidence"]])))
##        return observations
        
    def createNode(self,str nodeName,list stateNames):
        if re.compile(r'^[a-zA-Z]([a-zA-Z\-0-9]*[a-zA-Z0-9]+)?$').sub("",nodeName):
            raise ValueError("Node name shold only consist of alphabets and numbers, it should start with alphabet")
        if not stateNames:
            raise ValueError("Should contain atleast 1 dimention")
        for state in stateNames:
            if re.compile(r'^[a-zA-Z][a-zA-Z0-9]*').sub("",state):
                raise ValueError("Node name shold only consist of alphabets and numbers,  it should start with alphabet")
        self.nodes[nodeName]={"states":stateNames,"parents":[]}
        self.net.AddNode(PyString_AsString("continuous^"+nodeName), PyString_AsString(" ".join(stateNames)))
        return self.getNode(nodeName)

    def createEdge(self,parentNodes,childNodes):
        pNdtype=type(parentNodes)
        if pNdtype==list or pNdtype==tuple or pNdtype==set:
            parentNodes=list(parentNodes)
        elif pNdtype==str or  hasattr(parentNodes, 'getNodeName'):
            parentNodes=[parentNodes]
        else:
            raise TypeError("Invalid type for parent nodes")
        
        for i in range(len(parentNodes)):
            if not type(parentNodes[i])== str:
                if hasattr(parentNodes[i], 'getNodeName'):
                    parentNodes[i] = str(parentNodes[i].getNodeName())
                else:
                    raise TypeError("Invalid type for '%s'" % str(parentNodes[i]))
            if not parentNodes[i] in  self.nodes:
                raise NameError("node '%s' not found" % parentNodes[i])
            
        cNdtype=type(childNodes)
        if cNdtype==list or cNdtype==tuple or cNdtype==set:
            childNodes=list(childNodes)
        elif cNdtype==str or  hasattr(childNodes, 'getNodeName'):
            childNodes=[childNodes]
        else:
            raise TypeError("Invalid type for child nodes")
            
        for i in range(len(childNodes)):
            if not type(childNodes[i])== str:
                if hasattr(childNodes[i], 'getNodeName'):
                    childNodes[i] = str(childNodes[i].getNodeName())
                else:
                    raise TypeError("Invalid type for '%s'" % str(childNodes[i]))
            if not childNodes[i] in  self.nodes:
                raise NameError("node '%s' not found" % childNodes[i])
        if not len(parentNodes):
            raise ValueError("No parent node mentioned")
        if not len(childNodes):
            raise ValueError("No child node mentioned")
            
        pNodes=" ".join(parentNodes)
        cNodes=" ".join(childNodes)
        parentNodeList=parentNodes       
        for nodeName in childNodes:
            for pn in parentNodeList:
                self.nodes[nodeName]["parents"].append(pn) 
        self.net.AddArc(PyString_AsString(pNodes), PyString_AsString(cNodes))

    def setGaussianParams(self,node,mean,variance,weight=None,tabParentValues=None):
        if hasattr(node, 'getNodeName'):
            node=node.getNodeName()
        numStates=len(self.nodes[node]["states"])
        if numStates==1:
            if type(mean)==int or type(mean)==float:
                mean=[float(mean)]
            if type(variance)==int or type(variance)==float:
                variance=[float(variance)]
        if not (type(mean)==list or type(mean)==tuple):
            raise TypeError("Mean should be lists of floating point numbers")
        if not (type(variance)==list or type(variance)==tuple):
            raise TypeError("Variance should be lists of floating point numbers")
        mean=combinLists(mean,"Mean")
        variance=combinLists(variance,"variance")
        if not len(mean)==numStates:
            raise ValueError("No. of means should be equal to no. of states: got %s values " % len(variance))
        if not len(variance)==pow(numStates,2):
            raise ValueError("variance should be square times the number of states: got %s values " % len(variance))
        if weight:
            weight=combinLists(weight,"weight")
            if tabParentValues:
                tabParentValues=combinLists(tabParentValues,"tabParentValues")
                self.net.SetPGaussian(PyString_AsString(node),PyString_AsString(" ".join([str(i) for i in mean])),
                                      PyString_AsString(" ".join([str(i) for i in variance])),
                                      PyString_AsString(" ".join([str(i) for i in weight])) ,
                                      PyString_AsString(" ".join([str(i) for i in tabParentValues])))
            else:
                self.net.SetPGaussian(PyString_AsString(node),PyString_AsString(" ".join([str(i) for i in mean])),
                                      PyString_AsString(" ".join([str(i) for i in variance])),
                                      PyString_AsString(" ".join([str(i) for i in weight])))
        elif self.nodes[node]["parents"]:
            raise ValueError("no waights found when parent node present then number of weights=(no. of states * no. parents)")
        else:
            self.net.SetPGaussian(PyString_AsString(node),PyString_AsString(" ".join([str(i) for i in mean])),
                                  PyString_AsString(" ".join([str(i) for i in variance])))
        
        

    def getNode(self,str nodeName):
        if not nodeName in self.nodes:
            raise NameError("node not found")
        nodeObj=Node()
        nodeObj.setGaussianParams=lambda node,mean,variance,weight=None,tabParentValues=None:self.setGaussianParams(nodeName,mean,variance,weight,tabParentValues)
        nodeObj.getNodeName=lambda:nodeName
        nodeObj.getNodeParents=lambda:[self.getNode(parent) for parent in self.nodes[nodeName]["parents"]]
        nodeObj.getParentNames=lambda:self.nodes[nodeName]["parents"]
        nodeObj.getStateNames=lambda:self.nodes[nodeName]["states"]
        nodeObj.getMPE=lambda:self.getMPE(nodeName).values()[0]
        nodeObj.getJPD=lambda:self.getJPD(nodeName)
        nodeObj.getMean=lambda:self.getMean(nodeName)
        nodeObj.getCover=lambda:self.getCover(nodeName)
        nodeObj.getWeights=lambda parent:self.getWeights(nodeName,parent)
        return nodeObj

    def getEdge(self,node,childNode):
        if hasattr(node, 'getNodeName'):
            node = str(node.getNodeName())
        if hasattr(node, 'getNodeName'):
            childNode = str(childNode.getNodeName())
        if not (type(node)==str and type(childNode)==str):
            raise TypeError("Invalid Type for node or child")
        if not childNode in  self.nodes:
            raise NameError("child node not found")
        if not node in self.node[childNode]["parents"]:
            if not node in self.nodes:
                raise NameError("node not found")
            raise NameError("link not found")
        edge=Node()
        edge.link=lambda:{"top":self.getNode(node),"bottom":self.getNode(childNode)}
        edge.getWeights=lambda:self.getWeights(childNode,node)        
        return edge
            
    def getCurEvidence(self):
        evidence={}
        for i in self.__netAttribute["evidence"]:
            if i[0] in evidence:
                evidence[i[0]].append((i[1],self.__netAttribute["evidence"][i]))
            else:
                evidence[i[0]]=[(i[1],self.__netAttribute["evidence"][i])]                
        return evidence

    def clearEvidence(self):
        self.__netAttribute["evidence"] = {}
        self.net.ClearEvid()

    def editEvidence(self,observation):    
        new_observation={}
        for node in observation:
            if not node in self.nodes:
                raise ValueError("node name '%s' doesn't exist" % node)
            dType=type(observation[node])
            if (dType==int or dType==float) and len(self.nodes[node]["states"])==1:
                observation[node]=((self.nodes[node]["states"],observation[node]),)
            
            if (dType==tuple or dType==list) and len(observation[node])==2 and type(observation[node][0])==str:
                observation[node]=(observation[node],)
                
            for stateAndObsv in observation[node]:
                if not stateAndObsv[0] in self.nodes[node]["states"]:
                    raise ValueError("There is no state called '%s' for node '%s' " % (stateAndObsv[0],node))
                try:         
                    new_observation[(node,stateAndObsv[0])]=float(stateAndObsv[1])
                except:
                    raise TypeError("Invalid structure")                
        if self.__netAttribute["evidence"]:
            self.net.ClearEvid()
        self.__netAttribute["evidence"].update(copy.deepcopy(new_observation))
        if self.__netAttribute["evidence"]:
            self.net.EditEvidence(PyString_AsString(" ".join([j[0]+"^"+j[1]+"^"+str(new_observation[j]) for j in new_observation])))

    
    def __dealloc__(self):
        pass 

    
