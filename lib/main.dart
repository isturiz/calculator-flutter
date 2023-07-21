import 'package:flutter/material.dart';

void main() {
    runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CalculatorMain(),
        );
    }
}

class CalculatorMain extends StatefulWidget {
    @override
    _CalculatorMainState createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {
    Color myCustomColor = Color.fromRGBO(23, 60, 142, 1.0);
    double _firstNumber = 0;
    double _secondNumber = 0;
    String _operation = "";
    double _result = 0;

    TextEditingController _firstNumberController = TextEditingController();
    TextEditingController _secondNumberController = TextEditingController();

    void _performOperation(String operator) {
        setState(() {
            _firstNumber = double.tryParse(_firstNumberController.text) ?? 0;
            _secondNumber = double.tryParse(_secondNumberController.text) ?? 0;

            switch (operator) {
                case '+':
                    _operation = "Suma";
                    _result = _firstNumber + _secondNumber;
                    break;
                case '-':
                    _operation = "Resta";
                    _result = _firstNumber - _secondNumber;
                    break;
                case 'x':
                    _operation = "Multiplicación";
                    _result = _firstNumber * _secondNumber;
                    break;
                case '÷':
                    _operation = "División";
                    _result = _firstNumber / _secondNumber;
                    break;
            }
        });
    }

    void _clearValues() {
        setState(() {
            _firstNumberController.text = "";
            _secondNumberController.text = "";
            _operation = "";
            _result = 0;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.fill,
                    ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                    children: [
                        SizedBox(height: 20),
                        // Logo Image
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset("assets/images/logocasio.jpg", height: 100),
                        ),
                        SizedBox(height: 30),
                        // First Number Input
                        TextFormField(
                            controller: _firstNumberController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.edit),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () => _firstNumberController.clear(),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,                             ),
                        ),
                        SizedBox(height: 10),
                        // Second Number Input
                        TextFormField(
                            controller: _secondNumberController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.edit),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () => _secondNumberController.clear(),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white, // Set the background color to white
                            ),
                        ),
                        SizedBox(height: 20),
                        // Result Text
                        Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: myCustomColor,
                                borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                                "Resultado $_operation: $_result",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                        ),
                        SizedBox(height: 20),
                        // Operation Buttons
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                ElevatedButton(
                                    onPressed: () => _performOperation('+'),
                                    child: Text("+"),
                                    style: ElevatedButton.styleFrom(
                                        primary: myCustomColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                        ),
                                    ),
                                ),
                                ElevatedButton(
                                    onPressed: () => _performOperation('-'),
                                    child: Text("-"),
                                    style: ElevatedButton.styleFrom(
                                        primary: myCustomColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                        ),
                                    ),
                                ),
                                ElevatedButton(
                                    onPressed: () => _performOperation('x'),
                                    child: Text("x"),
                                    style: ElevatedButton.styleFrom(
                                        primary: myCustomColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                        ),
                                    ),
                                ),
                                ElevatedButton(
                                    onPressed: () => _performOperation('÷'),
                                    child: Text("÷"),
                                    style: ElevatedButton.styleFrom(
                                        primary: myCustomColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                        ),
                                    ),
                                ),
                                ],
                                ),
                                SizedBox(height: 20),
                                // Clear Button
                                ElevatedButton(
                                    onPressed: _clearValues,
                                    child: Text("Limpiar"),
                                    style: ElevatedButton.styleFrom(
                                        primary: myCustomColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                        ),
                                    ),
                                ),
                                ],
                                ),
                                ),
                                bottomNavigationBar: Container(
                                    padding: EdgeInsets.all(10.0),
                                    color: myCustomColor,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Text(
                                                "Inspirado en el diseño de Alexis Uranga",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                ),
                                            ),
                                            Text(
                                                "Hecho por ©isturiz",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                ),
                                            ),
                                        ],
                                    ),
                                    ),
                                    );
    }
}
