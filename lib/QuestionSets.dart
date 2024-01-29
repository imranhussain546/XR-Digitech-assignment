
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/QuestionSets.dart';
import 'model/Questions.dart';

class QuestionSets extends StatefulWidget {
  const QuestionSets({super.key});
  @override
  State<QuestionSets> createState() => _QuestionSetsState();
}

var itemTap=false;
List<QuestionsSets> questionSets=[
  QuestionsSets(question: 'Ios Current version ?', questionsChoice: [QuestionModel('14', false),QuestionModel('16', false),QuestionModel('13', false),QuestionModel('17', true)]),
  QuestionsSets(question: 'Android current version ?', questionsChoice: [QuestionModel('14', true),QuestionModel('16', false),QuestionModel('13', false),QuestionModel('17', false)]),
  QuestionsSets(question: 'Flutter current sdk?', questionsChoice: [QuestionModel('3.3.8', false),QuestionModel('3.3.9', false),QuestionModel('3.7.0', true),QuestionModel('4.0', false)]),
];
PageController pageController2 = PageController(keepPage: true);
class _QuestionSetsState extends State<QuestionSets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1.74,
                child: PageView.builder(
                  itemCount: questionSets.length,
                  controller: pageController2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return  Column(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                              color: Colors.black26
                          ),
                          child: Center(
                              child: Text('${questionSets[index].question}',style: TextStyle(color: Colors.white,fontSize: 20),)),),
                        SizedBox(height: 20,),
                        Container(
                          height: 300,
                          child: ListView.separated(
                            itemCount: questionSets[index].questionsChoice!.length,
                            itemBuilder: (context,choiceIndex){
                              return  GestureDetector(
                                onTap: (){
                                  setState(() {
                                    setState(() {
                                      for (int i = 0; i < questionSets[index].questionsChoice!.length; i++) {
                                        questionSets[index].questionsChoice?[i].isSelected = (i == choiceIndex);
                                        itemTap=true;
                                      }
                                    });
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: questionSets[index].questionsChoice?[choiceIndex].isSelected ?? false
                                        ? (questionSets[index].questionsChoice?[choiceIndex].isCorrect ?? false)
                                        ? Colors.green
                                        : Colors.red
                                        :itemTap?(questionSets[index].questionsChoice?[choiceIndex].isCorrect ?? false)
                                        ? Colors.green
                                        : Colors.white:Colors.white,

                                    borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 1, // Adjust the border width as needed
                                    ),
                                  ),
                                  child: Center(child: Text( '${questionSets[index].questionsChoice?[choiceIndex].question}',style: TextStyle(fontSize: 18,color: Colors.black),)) ,
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5,); },),
                        )

                      ],
                    );
                  },

                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      pageController2.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                      itemTap=false;
                    },
                    child: Container(
                      width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                            color: Colors.blueAccent
                        ),
                      child: Center(child: Text('Prev',style: TextStyle(fontSize: 16,color: Colors.white),)),),
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController2.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                      itemTap=false;
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                          color: Colors.blueAccent
                      ),
                      child: Center(child: Text('Next',style: TextStyle(fontSize: 16,color: Colors.white),)),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }

}
