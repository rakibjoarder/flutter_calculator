import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => new _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.00;
  double num2 = 0.00;
  String operand ="";

  buttonPressed(String buttontext){
    if(buttontext == "C"){
      _output = "0";
       num1 = 0.00;
       num2 = 0.00;
      operand ="";
    }else if(buttontext == "+"|| buttontext == "-" || buttontext == "*" || buttontext == "/"){
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
    }else if(buttontext =="<="){
       int len = output.length -1 ;
      print(len);
      if(len > 0){
        _output = output.substring(0,len);
      }else{
        _output = "";
      }
    }else if(buttontext == "="){
      num2 =double.parse(output);
      if(operand =="+"){
        _output =(num1+num2).toString();
      }
      if(operand =="-"){
        _output =(num1-num2).toString();
      }
      if(operand =="*"){
        _output =(num1*num2).toString();
      }
      if(operand =="/"){
        _output =(num1/num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else{

      if(_output.startsWith("0") && !_output.contains(".")){
        _output = buttontext;
      }else{
      _output = _output+buttontext;
    }
    }


    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttontext){
    return new Expanded(
      child: new MaterialButton(
        padding: EdgeInsets.all(24.00),
        child : new Text(buttontext,style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.00,
        ),),
        color: Colors.teal ,
        onPressed: ()=>buttonPressed(buttontext),
        splashColor: Colors.tealAccent,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Calculator'),
      ),
      body: new Container(
          child: new Column(
          children: <Widget>[
           new Container(
             alignment: Alignment.centerRight,
             padding: const EdgeInsets.symmetric(
               vertical: 20.00,
               horizontal: 12.00
             ),
           child : new Column(
             children: <Widget>[
               new Text("$output",
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ))
             ],
           )
            ),
            new Expanded(child: new Divider()),
            new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("+")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("*")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    new Expanded(
                      child: new MaterialButton(
                        padding: EdgeInsets.all(24.00),
                        child : new Icon(Icons.backspace,
                        size: 28.00,
                         color: Colors.white,
                          ),
                        color: Colors.teal ,
                        onPressed: ()=> buttonPressed("<="),
                        splashColor: Colors.tealAccent,
                      ),
                    ),
                    buildButton("/")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("C"),
                    buildButton("="),
                  ],
                )

              ],
            ),
          ],
        )
      ),
    );
  }
}