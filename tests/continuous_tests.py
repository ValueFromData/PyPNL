from PNL import BayesNet
import unittest




def basic_network(only_structure=False):
    """
    create basic network to test the APIs
    """
    
    Net = BayesNet("continuous")
    network_struct =  {
        "node1": { 
            "states": ["dim1"],
        },
        "node2" : { 
            "states": ["dim1","dim2"],
        },
        "node3" : { 
            "states": ["dim1","dim2","dim3"],
        },
        "node4" : { 
            "states": ["dim1","dim2","dim3"],
        },
        "node5" : { 
            "states": ["dim1"],
        },
    }

    Net.create_network(network_struct)
    return Net



def partial_network(only_structure=False):
    """
    create basic network to test the APIs
    """
    
    Net = BayesNet("continuous")
    network_struct =  {
        "node1": { 
            "states": ["dim1"],
        },
        "node2" : { 
            "states": ["dim1","dim2"],
        },
        "node3" : { 
            "states": ["dim1","dim2","dim3"],
        },
        "node4" : { 
            "states": ["dim1","dim2","dim3"],
        },
    }

    Net.create_network(network_struct)
    return Net







class TestCreateNetwork(unittest.TestCase):
    """
    Test cases for network creation
    """
    
    def setUp(self):
        self.Net = BayesNet("continuous")
        self.valid_structure =  {
            "node1": { 
                "states": ["dim1"],
            },
            "node2" : { 
                "states": ["dim1","dim2"],
            },
            "node3" : { 
                "states": ["dim1","dim2","dim3"],
            },
            "node4" : { 
                "states": ["dim1","dim2","dim3"],
            },
        }
        
    
    def test_valid_network(self):
        """
        create network from a valid structure
        """
        
        self.assertEquals(None,self.Net.create_network(self.valid_structure))
        
        
    
    def test_invalid_network(self):
        """
        create network from an invalid structure
        """

        
        
class TestCreateNode(unittest.TestCase):
    """
    Test cases for creating node
    """
    
    def setUp(self):
        self.Net = partial_network()
        
        
    def test_create_valid_node(self):
        """
        creating a valid node
        """
        
        node5 = self.Net.createNode("node5",["dim1"])
        self.assertEquals('Node',node5.__class__.__name__)
    
    
    def test_create_node_nostates(self):
        """
        create node with no states
        """
    
        self.assertRaises(ValueError,self.Net.createNode,"node6",[])

        
    def test_create_existing_node(self):
        """
        try creating an existing node
        """
        
        
class TestGetNode(unittest.TestCase):
    """
    Test cases for Net.getNode(Node Name) 
    """
    
    def setUp(self):
        self.Net = basic_network()
    
    
    def test_get_valid_node(self):
        """
        get an existing node
        """
        
        node1 = self.Net.getNode("node1")
        self.assertEquals('Node',node1.__class__.__name__)
    
    
    def test_get_nonexistant_node(self):
        """
        get a non-existing node
        """
        
        self.assertRaises(NameError,self.Net.getNode,"node6")
        
        
    def test_get_node_emptyparameters(self):
        """
        get node without specifying node name
        """
        
        self.assertRaises(TypeError,self.Net.getNode)
        
        

class TestCreateEdge(unittest.TestCase):
    """
    Test cases for creating edge between nodes
    """
    
    
    def test_create_edge_2_nodes(self):
        """
        create a valid edge between two nodes
        """

        Net = basic_network()
        self.assertEquals(None,Net.createEdge("node1","node3"))
        
        
    
    def test_create_edge_multiple_childs(self):
        """
        create a valid edge between nodes by specifying node names
        test is between one parent and many child nodes
        """
        
        Net = basic_network()
        self.assertEquals(None,Net.createEdge("node1",["node2","node3"]))
        
        
    def test_create_edge_multiple_parents(self):
        """
        create a valid edge betweem multiple parents and one child
        """
        
        Net = basic_network()
        self.assertEquals(None,Net.createEdge(["node1","node2"],"node3"))
        
        
    def test_create_edge_objects(self):
        """
        create edge by passing objects instead of node names
        """
        
        Net = basic_network()
        node1 = Net.getNode("node1")
        node2 = Net.getNode("node2")
        node3 = Net.getNode("node3")
        self.assertEquals(None,Net.createEdge([node1,node2],node3))
        # test combination of objects and names
        self.assertEquals(None,Net.createEdge([node3,"node4"],"node5"))
        
    
    def test_create_edge_nochild(self):
        """
        create edge with a missing pararmeter
        """
        
        Net = basic_network()
        self.assertRaises(TypeError,Net.createEdge,"node1")
        
        
        
        
        
        
        
        
        
if __name__ == '__main__':
    unittest.main()