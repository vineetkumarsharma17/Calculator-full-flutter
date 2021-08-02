import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/buttons.dart';
import 'package:my_calculator/drawer.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var userInput = '';
  var answer = '';
  // Array of button
  final List<String> buttons = [
    'C','+/-','%','DEL',
    '7','8','9','/',
    '4','5','6','x',
    '1','2','3','-',
    '0','.','=','+',  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4
                    ),
                    itemBuilder:(BuildContext context ,int index) {
                    if(index==0){
                      return MyButton(buttonText: buttons[index],
                      color: Colors.blue,
                      textColor: Colors.black,
                      buttontapped: (){
                        setState(() {
                          userInput='';
                          answer='0';
                        });
                      },
                      );
                    } // +/- button
                    else if(index==1){
                      return MyButton(
                        buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black,);
                    }// % Button
                    else if(index==2){
                      return MyButton(buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      buttontapped: (){
                        setState(() {
                          userInput+=buttons[index];
                        });
                      },);
                    }
                    // Delete Button
                    else if(index==3){
                      return MyButton(buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                        buttontapped: (){
                        setState(() {
                          userInput=userInput.substring(0,userInput.length-1);
                        });
                        },
                      );
                    }
                    // Equal_to Button
                    if(index==18){
                      return MyButton(
                          buttonText: buttons[index],
                      buttontapped: (){
                            setState(() {
                              equalPressed();
                            });
                      },
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }
                    else
                      return MyButton(buttonText: buttons[index],
                        color: isOperator(buttons[index])? Colors.blueAccent : Colors.white,
                        textColor: isOperator(buttons[index])? Colors.white : Colors.black,
                        buttontapped: (){
                        setState(() {
                          userInput+=buttons[index];
                        });
                        },
                      );
                    },
                ),
          )
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }

  bool isOperator(String x) {
    if(x=='/'||x == 'x' || x == '-' || x == '+' || x == '=')
      return true;
    else
      return false;

  }
  void equalPressed(){
    String finaluserinput=userInput;
    finaluserinput=userInput.replaceAll('x', "*");
    Parser p=Parser();
    Expression exp=p.parse(finaluserinput);
    ContextModel cm=ContextModel();
    double eval=exp.evaluate(EvaluationType.REAL, cm);
    answer=eval.toString();
  }
}


