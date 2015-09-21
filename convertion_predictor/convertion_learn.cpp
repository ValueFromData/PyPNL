#include <time.h>
#include "pnlHigh.hpp"
#include "console.hpp"
#include "pnl_dll.hpp"
#include <iostream>
#include <string>

using namespace std;



int main()
{
    BayesNet net;
    // adding nodes
    net.AddNode("discrete^Converted", "Premium Demo"); 
    net.AddNode("discrete^Email", "Specific Generic");
    net.AddNode("discrete^Company", "Specified NotSpecified");
    net.AddNode("discrete^JobTitle", "Present Absent");
    net.AddNode("discrete^Purpose", "Specified NotSpecified");
    net.AddNode("discrete^Activity", "Occured NotOccured");

    //adding edges
    net.AddArc("Converted", "Email Company JobTitle Purpose Activity");

    // specifying the conditional probabilities
//    net.SetPTabular("Converted^Premium Converted^Demo", "0.1302 0.8698");

//    net.SetPTabular("Email^Specific Email^Generic", "0.8394 0.1606", "Converted^true");
//    net.SetPTabular("Email^Specific Email^Generic", "0.5895 0.4105", "Converted^false");
//    net.SetPTabular("Company^Specified Company^NotSpecified", "0.6451 0.3549", "Converted^true");
//    net.SetPTabular("Company^Specified Company^NotSpecified", "0.1864 0.8136", "Converted^false");
//    net.SetPTabular("JobTitle^Present JobTitle^Absent", "0.6155 0.3845", "Converted^true");
//    net.SetPTabular("JobTitle^Present JobTitle^Absent", "0.1697 0.8303", "Converted^false");
//    net.SetPTabular("Purpose^Specified Purpose^NotSpecified", "0.40282 0.59718", "Converted^true");
//    net.SetPTabular("Purpose^Specified Purpose^NotSpecified", "0.13177 0.86823", "Converted^false");
//    net.SetPTabular("Activity^Occured Activity^NotOccured", "0.99868 0.00132", "Converted^true");
//    net.SetPTabular("Activity^Occured Activity^NotOccured", "0.32406 0.67594", "Converted^false");
     net.LoadEvidBuf("convertion_table_training.csv");
     net.LearnParameters();
     net.ClearEvidBuf();     
    //To get the probability distribution of the node we must call the GetPTabular method:
    TokArr PConverted = net.GetPTabular("Converted");

    // Now it is possible to represent this distribution as string or as float numbers:
    String PConvertedStr = String(PConverted);
    float PConvertedTrue = PConverted[0].FltValue();
    float PConvertedFalse = PConverted[1].FltValue();
    string nodeAndAttr[5][3]={
                                                    { "Email","Generic","Specific"},
                                                    {"Company","NotSpecified","Specified"},
                                                    {"JobTitle","Absent","Present"},
                                                    {"Purpose","NotSpecified","Specified"},
                                                    {"Activity","NotOccured","Occured"},
                                                 };

    cout << PConvertedStr <<  endl << PConvertedTrue << "," << PConvertedFalse << endl;
    int input;
    for(int i=0;i<5;i++)
   {
       cout <<  "Choise for " << nodeAndAttr[i][0] << endl;
       cout << "-1 : Unknown" << endl;
       cout << " 0 : " << nodeAndAttr[i][1] << endl;
       cout << " 1 : " << nodeAndAttr[i][2] << endl;
       cin >> input;
       if(input==0 || input==1)
      {
          net.EditEvidence((nodeAndAttr[i][0] + "^" + nodeAndAttr[i][input+1]).c_str());
       }
    }
    TokArr PConversion = net.GetJPD("Converted");

    // Now it is possible to represent this distribution as string or as float numbers:
    //String PConversionStr = String(PConversion);
    float PConversionTrue = PConversion[0].FltValue();
   //float PConversionFalse = PConversion[1].FltValue();
    
    cout << "The probability of convertion is "<< PConversionTrue  << endl;
    //cout << PConversionStr <<  endl << PConversionTrue << "," << PConversionFalse << endl;
   
    return 0;
}
