import 'package:calculadora/math_expresions.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController output = TextEditingController(text: "");
  CalculatorMaths results = CalculatorMaths("0");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: false,
      ),
      //This is a comment
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextField(
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 30),
              controller: output,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 1000),
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              children: [
                boton("AC", Colors.white54),
                boton("%", Colors.white54),
                boton("/", Colors.white54),
                boton("\u{2190}", Colors.white54),
                boton("7", Colors.white54),
                boton("8", Colors.white54),
                boton("9", Colors.white54),
                boton("*", Colors.white54),
                boton("4", Colors.white54),
                boton("5", Colors.white54),
                boton("6", Colors.white54),
                boton("-", Colors.white54),
                boton("1", Colors.white54),
                boton("2", Colors.white54),
                boton("3", Colors.white54),
                boton("+", Colors.white54),
                Container(),
                boton("0", Colors.white54),
                boton(".", Colors.white54),
                boton("=", Colors.blue, txtColor: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget boton(btntxt, Color btnColor, {Color txtColor = Colors.black}) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: TextButton(
            child: Text(
              btntxt,
              style: TextStyle(
                  fontSize: 28.0, color: txtColor, fontFamily: 'RobotoMono'),
            ),
            onPressed: () {
              setState(() {
                switch (btntxt) {
                  case "\u{2190}":
                    output.text =
                        output.text.substring(0, output.text.length - 1);
                    break;
                  case "AC":
                    output.text = "";
                    break;
                  case "=":
                    results = CalculatorMaths(output.text);
                    output.text = results.getResults();

                    break;
                  case ".":
                    if (output.text == "") {
                      output.text = "0.";
                    } else {
                      output.text = output.text + btntxt;
                    }
                    break;
                  default:
                    output.text = output.text + btntxt;
                    break;
                }
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(18.0),
              backgroundColor: btnColor,
              shape: CircleBorder(),
              elevation: 5,
            )));
  }
}
