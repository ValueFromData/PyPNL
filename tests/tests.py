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
        
        
        
        
        
if __name__ == '__main__':
    unittest.main()