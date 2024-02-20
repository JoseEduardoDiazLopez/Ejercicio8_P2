import 'package:flutter/material.dart';
import 'AppVector.dart';
import 'AppImagenes.dart';


void main() {
  runApp(AppFactorial());
}

class AppFactorial extends StatefulWidget {
  @override
  _AppFactorialState createState() => _AppFactorialState();
}

class _AppFactorialState extends State<AppFactorial> {

  TextEditingController _numberController = TextEditingController();
  int _factorialResult=0;

  void _calculateFactorial() {
    setState(() {
      int number = int.parse(_numberController.text);
      if (number != null && number >= 0) {
        _factorialResult = _calculateRecursiveFactorial(number);
      } else {
        
        _factorialResult = 0;
      }
    });
  }

  int _calculateRecursiveFactorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * _calculateRecursiveFactorial(n - 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Factorial'),
           backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(Icons.numbers),
              onPressed: () {
           Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AppFactorial()),
                );
               
              },
            ),
            IconButton(
              icon: Icon(Icons.line_axis),
              onPressed: () {
           Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AppVector()),
                );
              },
            ),
               IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
           Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AppImagenes()),
                );
              },
            ),
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateFactorial,
              child: Text('Calcular Factorial'),
            ),
            SizedBox(height: 16.0),
            _factorialResult != null
                ? Text('Factorial: $_factorialResult')
                : Container(),
          ],
        ),
      ),
    ),
    );
  }
}