import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";
  bool _isOperandChosen = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentInput = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
        _isOperandChosen = false;
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "/") {
        if (_currentInput.isNotEmpty && !_isOperandChosen) {
          _operand = buttonText;
          _num1 = double.parse(_currentInput);
          _currentInput = "";
          _isOperandChosen = true;
        }
      } else if (buttonText == "=") {
        if (_currentInput.isNotEmpty && _isOperandChosen) {
          _num2 = double.parse(_currentInput);
          double result = _performOperation(_num1, _num2, _operand);
          _output = result.toString();
          _currentInput = "";
          _isOperandChosen = false;
        }
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }

  double _performOperation(double num1, double num2, String operand) {
    switch (operand) {
      case "+":
        return num1 + num2;
      case "-":
        return num1 - num2;
      case "x":
        return num1 * num2;
      case "/":
        if (num2 == 0) {
          return 0; // You can handle division by zero differently
        }
        return num1 / num2;
      default:
        return 0;
    }
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildButton("7"),
                      _buildButton("8"),
                      _buildButton("9"),
                      _buildButton("/"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buildButton("4"),
                      _buildButton("5"),
                      _buildButton("6"),
                      _buildButton("x"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buildButton("1"),
                      _buildButton("2"),
                      _buildButton("3"),
                      _buildButton("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buildButton("C"),
                      _buildButton("0"),
                      _buildButton("="),
                      _buildButton("+"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
