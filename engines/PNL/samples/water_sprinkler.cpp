#include <time.h>
#include "pnlHigh.hpp"
#include "console.hpp"
#include "pnl_dll.hpp"

using namespace std;

static int sMode = 0;
const int cShowPrediction = 1;
const int cShowMatrix = 2;


int main()
{
    BayesNet net;
    // adding nodes
    net.AddNode("discrete^Cloudy", "true false"); 
    net.AddNode("discrete^Sprinkler", "true false");
    net.AddNode("discrete^Rain", "true false");
    net.AddNode("discrete^WetGrass", "true false");

    //adding edges
    net.AddArc("Cloudy", "Sprinkler Rain");
    net.AddArc("Sprinkler Rain", "WetGrass");

    // specifying the conditional probabilities
    net.SetPTabular("Cloudy^true Cloudy^false", "0.6 0.4");

    net.SetPTabular("Sprinkler^true Sprinkler^false", "0.1 0.9", "Cloudy^true");
    net.SetPTabular("Sprinkler^true Sprinkler^false", "0.5 0.5", "Cloudy^false");
    net.SetPTabular("Rain^true Rain^false", "0.8 0.2", "Cloudy^true");
    net.SetPTabular("Rain^true Rain^false", "0.2 0.8", "Cloudy^false");
    //
    net.SetPTabular("WetGrass^true WetGrass^false", "0.99 0.01", "Rain^true Sprinkler^true ");
    net.SetPTabular("WetGrass^true WetGrass^false", "0.9 0.1", "Sprinkler^true Rain^false");
    net.SetPTabular("WetGrass^true WetGrass^false", "0.9 0.1", "Sprinkler^false Rain^true");
    net.SetPTabular("WetGrass^true WetGrass^false", "0.0 1.0", "Sprinkler^false Rain^false");

    //To get the probability distribution of the node we must call the GetPTabular method:
    TokArr PCloudy = net.GetPTabular("Cloudy");

    // Now it is possible to represent this distribution as string or as float numbers:
    String PCloudyStr = String(PCloudy);
    float PCloudyTrueF = PCloudy[0].FltValue();
    float PCloudyFalseF = PCloudy[1].FltValue();

    cout << PCloudyStr <<  std::endl << PCloudyTrueF << "," << PCloudyFalseF << std::endl;
    
    TokArr PSprinkler = net.GetPTabular("Sprinkler", "Cloudy^true");
    String PSprinklerStr = String(PSprinkler);
    float PSprinklerTrue = PSprinkler[0].FltValue();
    float PSprinklerFalse = PSprinkler[1].FltValue();
    
    
    cout << PSprinklerStr <<  std::endl << PSprinklerTrue  << "," << PSprinklerFalse << std::endl;
    
    // net.EditEvidence("Cloudy^false WetGrass^false");
    // if the above line is un commented then after the net line the evidence buffer will have "Sprinkler^true Cloudy^true  WetGrass^false"
    net.EditEvidence("Sprinkler^true Cloudy^true");
    
    TokArr PRain = net.GetJPD("Rain");

    // Now it is possible to represent this distribution as string or as float numbers:
    String PRainStr = String(PRain);
    float PRainTrueF = PRain[0].FltValue();
    float PRainFalseF = PRain[1].FltValue();
    
    
    cout << PRainStr <<  std::endl << PRainTrueF << "," << PRainFalseF << std::endl;

    TokArr PWetGrass = net.GetJPD("WetGrass");
    String PWetGrassStr = String(PWetGrass);
    float PWetGrassTrue = PWetGrass[0].FltValue();
    float PWetGrassFalse = PWetGrass[1].FltValue();
    
    
    cout << PWetGrassStr <<  std::endl << PWetGrassTrue << "," << PWetGrassFalse << std::endl;
    return 0;
}
