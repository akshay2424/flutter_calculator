import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNumber;
  int secondNumber;
  String texttoDisplay = "";
  String res;
  String operatorToperfom;

  void btnclicked(String btnvalue) {
    if (btnvalue == "C") {
      texttoDisplay = "";
      firstNumber = 0;
      secondNumber = 0;
      res = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "X" ||
        btnvalue == "/") {
      firstNumber = int.parse(texttoDisplay);
      res = "";
      operatorToperfom = btnvalue;
    } else if (btnvalue == "=") {
      secondNumber = int.parse(texttoDisplay);
      if (operatorToperfom == "+") {
        res = (firstNumber + secondNumber).toString();
      }
      if (operatorToperfom == "-") {
        res = (firstNumber - secondNumber).toString();
      }
      if (operatorToperfom == "X") {
        res = (firstNumber * secondNumber).toString();
      }
      if (operatorToperfom == "/") {
        res = (firstNumber / secondNumber).toString();
      }
    } else {
      res = int.parse(texttoDisplay + btnvalue).toString();
    }

    setState(() {
      texttoDisplay = res;
    });
  }

  Widget coustomWidget(String btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => btnclicked(btnvalue),
      child: Text("$btnvalue",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttoDisplay",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                coustomWidget("7"),
                coustomWidget("8"),
                coustomWidget("9"),
                coustomWidget("X"),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                coustomWidget("4"),
                coustomWidget("5"),
                coustomWidget("6"),
                coustomWidget("-"),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                coustomWidget("1"),
                coustomWidget("2"),
                coustomWidget("3"),
                coustomWidget("+"),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                coustomWidget("C"),
                coustomWidget("0"),
                coustomWidget("="),
                coustomWidget("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
