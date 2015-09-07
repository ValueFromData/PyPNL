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
    net.AddNode("discrete^Email", "Specific Generic");
    net.AddNode("discrete^CompanyName", "Specified NotSpecified");
    net.AddNode("discrete^Purpose", "Specified NotSpecified"); 
    net.AddNode("discrete^JobTitle", "Present Absent");
    net.AddNode("discrete^Activity", "Occured NotOccured");
    net.AddNode("discrete^Converted", "Premium Demo");
    net.LoadEvidBuf("convertion_table_training.csv");
    //net.SetProperty("Learning", "bayes");
    net.SetProperty("LearningStructureScoreFun","BIC");
    net.LearnStructure();
    //net.LearnParameters();
    net.ClearEvidBuf();     
    //To get the probability distribution of the node we must call the GetPTabular method:
    TokArr PConverted = net.GetPTabular("Converted");


    TokArr ConvertedParents = net.GetParents("Converted");
    TokArr ConvertedChildren = net.GetChildren("Converted");
    cout << String(PConverted ) << endl;
    cout << String(ConvertedParents ) << endl;
    cout << String(ConvertedChildren ) << endl;


    TokArr PEmail = net.GetPTabular("Email");
    TokArr EmailParents = net.GetParents("Email");
    TokArr EmailChildren = net.GetChildren("Email");
    cout << String(PEmail ) << endl;
    cout << String(EmailParents ) << endl;
    cout << String(EmailChildren ) << endl;



    TokArr PActivity = net.GetPTabular("Activity");
    TokArr ActivityParents = net.GetParents("Activity");
    TokArr ActivityChildren = net.GetChildren("Activity");
    cout << String(PActivity ) << endl;
    cout << String(ActivityParents ) << endl;
    cout << String(ActivityChildren ) << endl;

    TokArr PCompanyName = net.GetPTabular("CompanyName");
    TokArr CompanyNameParents = net.GetParents("CompanyName");
    TokArr CompanyNameChildren = net.GetChildren("CompanyName");
    cout << String(PCompanyName ) << endl;
    cout << String(CompanyNameParents ) << endl;
    cout << String(CompanyNameChildren ) << endl;
/*
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
  */ 
    return 0;
}
