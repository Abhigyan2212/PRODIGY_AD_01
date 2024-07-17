import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _input = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _input = "";
      _num1 = 0.0;
      _num2 = 0.0;
      _operator = "";
      _output = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "";
    } else if (buttonText == ".") {
      if (!_input.contains(".")) {
        _input = _input + buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);

      switch (_operator) {
        case "+":
          _output = (_num1 + _num2).toString();
          break;
        case "-":
          _output = (_num1 - _num2).toString();
          break;
        case "*":
          _output = (_num1 * _num2).toString();
          break;
        case "/":
          _output = (_num1 / _num2).toString();
          break;
        default:
          _output = _input;
          break;
      }

      _num1 = 0.0;
      _num2 = 0.0;
      _operator = "";
      _input = _output;
    } else {
      _input = _input + buttonText;
    }

    setState(() {
      _output = _input;
    });
  }

  Widget _buildButton(String buttonText, Color color, {Color textColor = Colors.white}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),

      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton("C", Colors.grey),
                  _buildButton("+/-", Colors.grey),
                  _buildButton("%", Colors.grey),
                  _buildButton("/", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.grey[850]!),
                  _buildButton("8", Colors.grey[850]!),
                  _buildButton("9", Colors.grey[850]!),
                  _buildButton("*", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.grey[850]!),
                  _buildButton("5", Colors.grey[850]!),
                  _buildButton("6", Colors.grey[850]!),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.grey[850]!),
                  _buildButton("2", Colors.grey[850]!),
                  _buildButton("3", Colors.grey[850]!),
                  _buildButton("+", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("0", Colors.grey[850]!),
                  _buildButton("00", Colors.grey[850]!),
                  _buildButton(".", Colors.grey[850]!),
                  _buildButton("=", Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
