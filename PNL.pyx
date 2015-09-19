##from libc.stdlib cimport malloc, free
from libcpp cimport bool
from operator import mul
from libcpp.string cimport string
from cpython.string cimport PyString_AsString
import copy
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
    string String(TokArr)

cdef extern from "<time.h>":
    pass

##class setProperty:
##
##    def __init__(self,net):
##        self.net=net.net
##    
##    def learn(self,algorithm=None,tolerance=None,maxNumberOfIterations=None):
##        raise NotImplemented
##
##    def gibsInferance(self,numStreams=None,thresholdIteration=None,numberOfIterations=None):
##        raise NotImplemented
##
##    def pearlInferance(self,tolerance=None,MaxNumberOfIterations=None):
##        raise NotImplemented
##
##    def jtreeInferance(self,tolerance=None,MaxNumberOfIterations=None):
##        raise NotImplemented
##
##    def naiveInferance(self,tolerance=None,MaxNumberOfIterations=None):
##        raise NotImplemented

class Node:
    pass

cdef class PyBayesNet:
    cdef BayesNet net 
    nodes = {}
    cdef char* nodeType
    evidence = {}
    target = None
    features = None
    __netAttribute={}
    def __init__(self,nodeType="discrete"):
        self.nodeType = PyString_AsString(nodeType)
        self.__netAttribute["evidence"]= {}
        self.__netAttribute["target"]= None
        self.__netAttribute["features"] = None
#        self.setProperty = setProperty(self.net)

    def create_network(self,dict network_struct,str casefile=""):
        nodes=[]
        nodesWithParent=[]
        for node in network_struct:
            dType=type(network_struct[node])
            if dType==dict or  dType==set:
                nodes.append(node)
                network_struct[node]=(None,network_struct[node])
            elif len(network_struct[node])==2 and type(network_struct[node][0])==set  and hasattr(network_struct[node][1], '__call__'):
                nodes.append(node)
                network_struct[node]=(None,{state:network_struct[node][1](state) for state in network_struct[node][0]})
            else:
                nodesWithParent.append(node)
        
        while nodesWithParent:
            leftoutNodes=[]
            for node in nodesWithParent:
                if not set(network_struct[node][0])-set(nodes):
                    nodes.append(node)
                    if len(network_struct[node])==3 and hasattr(network_struct[node][2], '__call__'):
                        pNStates=[(state,) for state in network_struct[network_struct[node][0][-1]][1]]
                        for pnode in network_struct[node][0][:-1]:
                            pNStates = [(pstate,)+state for pstate in network_struct[pnode][1] for state in pNStates]
                        network_struct[node]=(network_struct[node][0],{state:[states+(network_struct[node][2](state,*states),) for states in pNStates] for state in network_struct[node][1]})
                else:
                    leftoutNodes.append(node)
            if len(leftoutNodes)==len(nodesWithParent):
                raise TypeError("Network has cycles hence can't be topologically sorted")
            nodesWithParent=leftoutNodes
        for node in nodes:
            self.createNode(node,tuple(network_struct[node][1]))
            if network_struct[node][0]:
                self.createEdge(network_struct[node][0],node)
                if type(network_struct[node][1])==dict:
                    for state in network_struct[node][1]:
                        for pstates in network_struct[node][1][state]:
                            self.setProbability(node,(state,)+pstates[:-1],pstates[-1])
            elif type(network_struct[node][1])==dict:
                for state in network_struct[node][1]:
                    self.setProbability(node,state,network_struct[node][1][state])
                        
        if casefile.strip():
            self.net.LoadEvidBuf(PyString_AsString(casefile.strip()))
            self.net.LearnParameters()
            
         

    def setEvidence(self,observation):
        if self.__netAttribute["evidence"]:
            self.net.ClearEvid()
        self.__netAttribute["evidence"]=copy.deepcopy(observation)
        if self.__netAttribute["evidence"]:
            self.net.EditEvidence(PyString_AsString(" ".join([j+"^"+observation[j] for j in self.__netAttribute["evidence"]])))

    def getProblity(self,nodeName,observation=None):
        cdef TokArr resp
        cdef int i=0
        if type(observation)==dict:
            if self.__netAttribute["evidence"]:
                self.net.ClearEvid()
            if observation:
                self.net.EditEvidence(PyString_AsString(" ".join([j+"^"+observation[j] for j in observation])))
            resp = self.net.GetJPD(PyString_AsString(nodeName))
            if observation:
                self.net.ClearEvid()
            if self.__netAttribute["evidence"]:
                self.net.EditEvidence(PyString_AsString(" ".join([j+"^"+observation[j] for j in self.__netAttribute["evidence"]])))
        else:
            resp = self.net.GetJPD(PyString_AsString(nodeName))
        res = {}
        for state in self.nodes[nodeName]["states"]:
            res[state]=resp[i].FltValue()
            i+=1
        return res
        
    def getAllProblity(self,observation=None):
        resp=None
        if type(observation)==dict:
            if self.__netAttribute["evidence"]:
                self.net.ClearEvid()
            if observation:
                self.net.EditEvidence(PyString_AsString(" ".join([j+"^"+observation[j] for j in observation])))
            resp = {node:self.getProblity(node) for node in self.nodes}
            if observation:
                self.net.ClearEvid()
            if self.__netAttribute["evidence"]:
                self.net.EditEvidence(PyString_AsString(" ".join([j+"^"+observation[j] for j in self.__netAttribute["evidence"]])))
        else:
            resp = {node:self.getProblity(node) for node in self.nodes}
        return resp

    def getJPD(self,node,*parents):
        cdef TokArr resp
        cdef int i=0
        states = [[(node,state)] for state in self.nodes[node]["states"]]
        for pnode in parents:
            states = [[(pnode,pstate)]+state for pstate in self.nodes[pnode]["states"] for state in states]
        resp = self.net.GetJPD(PyString_AsString(" ".join([node]+parents)))
        res={}
        for state in states:
            res[tuple(state)]=resp[i].FltValue()
            i+=1
        return res

    def getMPE(self,node,*pnodes):
        cdef TokArr resp
        resp = self.net.GetMPE(PyString_AsString(" ".join([node]+pnodes)))
        res = String(resp)
        result = {}
        for node_state in res.split(" "):
            nodeState=node_state.split("^")
            result[nodeState[0]]=nodeState[1]
        return result

    def learnStructure(self,casefile,str target,tuple features=None):
        self.__netAttribute["target"]=target
        self.__netAttribute["features"]=features
        raise NotImplemented
        
    def setTargetNode(self,target):
        self.__netAttribute["target"]=target

    def evaluate(self,casefile):
        raise NotImplemented

    def classify(self,casefile):
        raise NotImplemented

    def createNode(self,nodeName,stateNames):
        self.nodes[nodeName]={"states":stateNames,"parents":[]}
        self.net.AddNode(PyString_AsString(nodeName), PyString_AsString(" ".join(stateNames)))

    def createEdge(self,parentNodes,childNodes):
        pNodes=cNodes=""
        parentNodeList=None        
        if type(parentNodes)==list or  type(parentNodes)==tuple:
            pNodes=" ".join(parentNodes)
            parentNodeList=list(parentNodes)
        elif type(parentNodes)== str:
            pNodes=parentNodes
            parentNodeList=[parentNodes]
        else:
            raise
        if type(childNodes)==list or  type(childNodes)==tuple:
            cNodes=" ".join(childNodes)
            for nodeName in childNodes:
                for pn in parentNodeList:
                    self.nodes[nodeName]["parents"].append(pn)
        elif type(childNodes)== str:
            cNodes=childNodes
            for pn in parentNodeList:
                self.nodes[childNodes]["parents"].append(pn)
        else:
            raise
        self.net.AddArc(PyString_AsString(pNodes), PyString_AsString(cNodes))

    def setProbability(self,node,states,probability):
        nodeAndState=""
        pNodeAndStates=""
        if self.nodes[node]["parents"]:
            nodeAndState=node+"^"+states[0]
            pNodeAndStates=" ".join([self.nodes[node]["parents"][i]+"^"+states[i+1] for i in range(len(self.nodes[node]["parents"]))])
            self.net.SetPTabular(PyString_AsString(nodeAndState),PyString_AsString(str(probability)),PyString_AsString(pNodeAndStates))
        else:
            nodeAndState=node+"^"+states
            self.net.SetPTabular(PyString_AsString(nodeAndState),PyString_AsString(str(probability)))
            

    def getNode(self,nodeName):
        nodeObj=Node()
        nodeObj.getProblity=lambda observation=None:self.getProblity(nodeName,observation)
        nodeObj.getNodeName=lambda:nodeName
        nodeObj.getNodeParents=lambda:[self.getNode(parent) for parent in self.nodes[nodeName]["parents"]]
        nodeObj.getParentNames=lambda:self.nodes[nodeName]["parents"]
        nodeObj.getStateNames=lambda:self.nodes[nodeName]["states"]
        nodeObj.getMPE=lambda:self.getMPE(nodeName).values()[0]
        nodeObj.getJPD=lambda:{key[0][1]:prob for key,prob in self.getJPD(nodeName).items()}
        return nodeObj

    def getCurEvidence(self):
        return self.__netAttribute["evidence"]

    def clearEvidence(self):
        self.__netAttribute["evidence"] = {}
        self.net.ClearEvid()

    def editEvidence(self,observation):
        self.__netAttribute["evidence"].update(copy.deepcopy(observation))
        self.net.EditEvidence(PyString_AsString(" ".join([j+"^"+observation[j] for j in observation])))
        

    def getTabularProb(self,node):
        cdef TokArr resp
        cdef int i=0
        resp = self.net.GetPTabular(PyString_AsString(str(node)))
        result ={}
        numStates=len(self.nodes[node]["states"])
        if not self.nodes[node]["parents"]:
            for j in range(numStates):
                result[self.nodes[node]["states"][j]]=resp[i].FltValue()
                i+=1
            return result        

        states = [[(node,state)] for state in self.nodes[node]["states"]]
        for pnode in self.nodes[node]["parents"][::-1]:
            states = [[(pnode,pstate)]+state for pstate in self.nodes[pnode]["states"] for state in states]

        for state in states:
            state.append(resp[i].FltValue())
            i+=1

        res = {state:{} for state in self.nodes[node]["states"]}
        for state in states:
            res[state[-2][1]][tuple(state[:-2])]=state[-1]
        return res
    
    def __dealloc__(self):
        pass 

    
