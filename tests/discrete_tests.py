from PNL import BayesNet
import unittest





class TestCreateNetwork(unittest.TestCase):
    """
    Test cases for creating a Network
    """
    
    def setUp(self):
        self.Net = BayesNet()
        
        # defining a valid network structure:
        self.valid_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : 0.7,
            },
            "node2" : {
                "s1" : 0.7,
                "s2" : 0.3,
            },
        }
        self.invalid_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : "invalid probability",
            },
        }

    
    
    def test_valid(self):
        """
        test if a valid network returns None
        """
        
        # successfully creating a network should return None
        self.assertEquals(None,self.Net.create_network(self.valid_structure))
        
        
        
    def test_invalid(self):
        """
        test if an invalid network structure throws a TypeError
        """
        
        self.assertRaises(TypeError,self.Net.create_network,self.invalid_structure)
                
            

            
class TestCreateNode(unittest.TestCase):
    """
    Test cases for creating individual nodes(i.e. not from the structure)
    """
    
    def setUp(self):
        """
        Create a basic network to test node creation
        """
        
        self.Net = BayesNet()
        network_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : 0.7,
            },
            "node2" : {
                "s1" : 0.7,
                "s2" : 0.3,
            },
        }    
        self.Net.create_network(network_structure)
        
        
    def test_create_node(self):
        """
        Test creating of a single valid node
        """
        
        node3 = self.Net.createNode("node3",['state1','state2'])
        self.assertEquals("Node", node3.__class__.__name__)
        
        
    def test_create_node_without_states(self):
        """
        Test creating a single node without specifying states
        """

        self.assertRaises(TypeError,self.Net.createNode,"node3")
        
        
        
        
class TestGetNode(unittest.TestCase):
    """
    Test cases for creating a node object
    """
    
    def setUp(self):
        self.Net = BayesNet()
        network_structure = {
                "node1" : {
                    "state1" : 0.3,
                    "state2" : 0.7,
                },
                "node2" : {
                    "s1" : 0.7,
                    "s2" : 0.3,
                },
            }
        
        self.Net.create_network(network_structure)
        
        
        
    def test_get_node(self):
        """
        test getNode() function for a valid node
        """
        
        
        node2 = self.Net.getNode("node2") 
        self.assertEquals("Node", node2.__class__.__name__)
    
    
    def test_get_node_unknown(self):
        """
        test getNode() function with an unknown node
        """
        
        self.assertRaises(NameError, self.Net.getNode,"node4")
    
    
    
    
class TestCreateEdge(unittest.TestCase):
    """
    Test cases for creating edge between nodes
    """
    
    def setUp(self):
        """
        Create a basic network to test edge creation
        """
        
        self.Net = BayesNet()
        self.network_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : 0.7,
            },
            "node2" : {
                "s1" : 0.7,
                "s2" : 0.3,
            },
            "node3" : {
                "s1" : 0.5,
                "s2" : 0.5
            },
        }    
    
        
    
    def test_create_edge(self):
        """
        Test createEdge() between two nodes
        """

        self.Net.create_network(self.network_structure)
        self.assertEquals(None, self.Net.createEdge("node1","node2"))
        
        
    def test_create_edge_childs(self):
        """
        Test createEdge() between parent and many child nodes
        """
        
        self.Net.create_network(self.network_structure)
        self.assertEquals(None, self.Net.createEdge("node1",["node2","node3",]))
    
    
    def test_create_edge_parents(self):
        """
        Test createEdge() between parent and many parent nodes
        """
        
        self.Net.create_network(self.network_structure)
        self.assertEquals(None, self.Net.createEdge(["node1","node2"],"node3",))
    
    
    def test_create_edge_unknown(self):
        """
        Test the error thrown when edge is created with a non-existant node
        """
        
        self.Net.create_network(self.network_structure)
        # A NameError should be thrown incase of an unknown error
        self.assertRaises(NameError, self.Net.createEdge,"node0","node3")
        

    def test_create_edge_invalid(self):
        """
        Test the error thrown when edge is created with invalid number of parameters
        """
        
        self.Net.create_network(self.network_structure)
        # A TypeError should be thrown incase of an unknown error
        self.assertRaises(TypeError, self.Net.createEdge,"node0","node2","node3")
        

        
        
        
class TestGetProbability(unittest.TestCase):
    """
    Test cases for getProbability()
    """

    def setUp(self):
        """
        Create a basic network to test setting of probability
        """
        
        self.Net = BayesNet()
        network_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : 0.7,
            },
            "node2" : {
                "s1" : 0.7,
                "s2" : 0.3,
            },
            "node3" : {
                "s1" : 0.5,
                "s2" : 0.5
            },
        }    
        
        self.Net.create_network(network_structure)
        self.Net.createEdge("node1",["node2","node3"])
        self.node1 = self.Net.getNode("node1")
        #self.node2 = self.Net.getNode("node2")
        #self.node3 = self.Net.getNode("node3")

        
    def test_get_probability_withobject(self):
        """
        testing getProbability() function for a valid case using a node object
        """
        
        probability = self.node1.getProbability()
        self.assertAlmostEqual(0.3,probability['state1'])
        self.assertAlmostEqual(0.7,probability['state2'])
    
    def test_get_probability_withparameter(self):
        """
        testing getProbability() function for a valid case by passing the node name as a parameter
        """
        
        probability = self.Net.getProbability("node1")
        self.assertAlmostEqual(0.3,probability['state1'])
        self.assertAlmostEqual(0.7,probability['state2'])

    
    def test_get_probability_new_observation(self):
        """
        testing getProbability(Node Name,observation) for a new observation
        """
        
        probability = self.Net.getProbability("node2",{"node2":"s2"})
        self.assertDictEqual({'s1':0.0,'s2':1.0},probability)
    
    
    def test_get_all_probability(self):
        """
        testing getAllProbability(observation) for a new observation
        """
        
        probability = self.Net.getAllProbability({"node2":"s2"})
        self.assertAlmostEqual(0.3,probability['node1']['state1'])
        self.assertAlmostEqual(0.7,probability['node1']['state2'])
        self.assertAlmostEqual(0.0,probability['node2']['s1'])
        self.assertAlmostEqual(1.0,probability['node2']['s2'])
        self.assertAlmostEqual(0.5,probability['node3']['s1'])
        self.assertAlmostEqual(0.5,probability['node3']['s2'])
        
        
        
        
class TestEvidence(unittest.TestCase):
    """
    Test cases for settings, editing and clearing evidence in the network
    """
    
    def setUp(self):
        """
        Create a basic network to test setting of probability
        """
        
        self.Net = BayesNet()
        network_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : 0.7,
            },
            "node2" : {
                "s1" : 0.7,
                "s2" : 0.3,
            },
            "node3" : {
                "s1" : 0.5,
                "s2" : 0.5
            },
        }    
        
        self.Net.create_network(network_structure)
        self.Net.createEdge("node1",["node2","node3"])
        self.node1 = self.Net.getNode("node1")
        self.node2 = self.Net.getNode("node2")
        self.node3 = self.Net.getNode("node3")
        
        self.Net.setProbability(self.node2,["s1", 'state1'],0.3)
        self.Net.setProbability(self.node2,["s1", 'state2'],0.1)
        self.Net.setProbability(self.node2,["s2", 'state1'],0.7)
        self.Net.setProbability(self.node2,["s2", 'state2'],0.9)
        self.Net.setProbability(self.node3,["s1", 'state1'],0.4)
        self.Net.setProbability(self.node3,["s1", 'state2'],0.0)
        self.Net.setProbability(self.node3,["s2", 'state1'],0.6)
        self.Net.setProbability(self.node3,["s2", 'state2'],1.0)

        
        
    def test_set_evidence_valid(self):
        """
        Test setEvidence(observation) for a valid case
        """
        
        self.Net.setEvidence({"node2":"s2"})
        probability = self.Net.getProbability("node2")
        self.assertAlmostEqual(1.0, probability['s2'])
    
    
        
    def test_clear_evidence_valid(self):
        """
        Test Net.clearEvidence() for a valid case
        """
        
        initial_probability = self.Net.getProbability("node2")
        self.Net.setEvidence({"node2":"s2"})
        probability = self.Net.getProbability("node2")
        self.assertAlmostEqual(1.0, probability['s2'])
        self.Net.clearEvidence()
        probability = self.Net.getProbability("node2")
        self.assertEquals(initial_probability['s2'], probability['s2'])
        

    def test_current_evidence_valid(self):
        """
        test getCurEvidence() for a vaid case
        """
        self.Net.setEvidence({"node2":"s2"})
        self.assertDictEqual({"node2":"s2"},self.Net.getCurEvidence())
        self.Net.clearEvidence()
        
        
    def test_edit_evidence(self):
        """
        Test Net.editEvidence(observation) for a valid case
        """
        
        self.Net.setEvidence({"node2":"s2"})
        probability = self.Net.getProbability("node2")
        self.assertAlmostEqual(1.0, probability['s2'])
        self.Net.setEvidence({"node2":"s1"})
        probability = self.Net.getProbability("node2")
        self.assertAlmostEqual(0.0, probability['s2'])

        

        
class TestSetProbability(unittest.TestCase):
    """
    Test cases for setting the probability of a node
    
    Net.setProbability(Node,[`state name`, `parent states`],probability) 
    """
    
    def setUp(self):
        """
        Create a basic network to test setting of probability
        """
        
        self.Net = BayesNet()
        network_structure = {
            "node1" : {
                "state1" : 0.3,
                "state2" : 0.7,
            },
            "node2" : {
                "s1" : 0.7,
                "s2" : 0.3,
            },
            "node3" : {
                "s1" : 0.5,
                "s2" : 0.5
            },
        }    
        
        self.Net.create_network(network_structure)
        
    
    
    def test_set_probability_noparents(self):
        """
        Test setProbability() function for node with no parents
        """
        
        self.Net.createEdge("node1",["node2","node3"])
        node1 = self.Net.getNode("node1")
        self.Net.setProbability(node1,"state1",0.1)
        self.Net.setProbability(node1,"state2",0.9)
        probabilities = node1.getProbability()
        self.assertAlmostEqual(0.1,probabilities['state1'])
        self.assertAlmostEqual(0.9,probabilities['state2'])
        
        
        
    def test_set_probability_single_parent(self):
        """
        Test setProbability() function of node with single parent
        """
        
        self.Net.createEdge("node1",["node2","node3"])
        node1 = self.Net.getNode("node1")
        node2 = self.Net.getNode("node2")
        node3 = self.Net.getNode("node3")
        
        self.Net.setProbability(node2,["s1", 'state1'],0.3)
        self.Net.setProbability(node2,["s1", 'state2'],0.1)
        self.Net.setProbability(node2,["s2", 'state1'],0.7)
        self.Net.setProbability(node2,["s2", 'state2'],0.9)
        self.Net.setProbability(node3,["s1", 'state1'],0.4)
        self.Net.setProbability(node3,["s1", 'state2'],0.0)
        self.Net.setProbability(node3,["s2", 'state1'],0.6)
        self.Net.setProbability(node3,["s2", 'state2'],1.0)
        
        probability = self.Net.getProbability("node2",{"node1":"state1"})
        self.assertAlmostEqual(0.3, probability['s1'])
        self.assertAlmostEqual(0.7, probability['s2'])
        probability = self.Net.getProbability("node2",{"node1":"state2"})
        self.assertAlmostEqual(0.1, probability['s1'])
        self.assertAlmostEqual(0.9, probability['s2'])
        probability = self.Net.getProbability("node3",{"node1":"state1"})
        self.assertAlmostEqual(0.4, probability['s1'])
        self.assertAlmostEqual(0.6, probability['s2'])
        probability = self.Net.getProbability("node3",{"node1":"state2"})
        self.assertAlmostEqual(0.0, probability['s1'])
        self.assertAlmostEqual(1.0, probability['s2'])
        
    
    
    def test_set_probability_multiple_parent(self):
        """
        Test setProbability() function of node with multiple parents
        """
        
        self.Net.createEdge(["node1","node2"],"node3")
        node1 = self.Net.getNode("node1")
        node2 = self.Net.getNode("node2")
        node3 = self.Net.getNode("node3")

        self.Net.setProbability(node3,["s1", 'state1','s1'],0.3)
        self.Net.setProbability(node3,["s1", 'state1','s2'],0.1)
        self.Net.setProbability(node3,["s1", 'state2','s1'],0.5)
        self.Net.setProbability(node3,["s1", 'state2','s2'],0.7)
        self.Net.setProbability(node3,["s2", 'state1','s1'],0.7)
        self.Net.setProbability(node3,["s2", 'state1','s2'],0.9)
        self.Net.setProbability(node3,["s2", 'state2','s1'],0.5)
        self.Net.setProbability(node3,["s2", 'state2','s2'],0.3)
               
        probability = self.Net.getProbability("node3",{"node1":"state1","node2":"s1"})
        self.assertAlmostEqual(0.3, probability['s1'])
        self.assertAlmostEqual(0.7, probability['s2'])
        probability = self.Net.getProbability("node3",{"node1":"state1","node2":"s2"})
        self.assertAlmostEqual(0.1, probability['s1'])
        self.assertAlmostEqual(0.9, probability['s2'])
        probability = self.Net.getProbability("node3",{"node1":"state2","node2":"s1"})
        self.assertAlmostEqual(0.5, probability['s1'])
        self.assertAlmostEqual(0.5, probability['s2'])
        probability = self.Net.getProbability("node3",{"node1":"state2","node2":"s2"})
        self.assertAlmostEqual(0.7, probability['s1'])
        self.assertAlmostEqual(0.3, probability['s2'])
        
        
        
        
        
        
if __name__ == '__main__':
    unittest.main()