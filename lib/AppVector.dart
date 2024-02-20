import 'AppImagenes.dart';
import 'AppFactorial.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AppVector());
}

class AppVector extends StatefulWidget {
  @override
  _AppVectorState createState() => _AppVectorState();
}

class _AppVectorState extends State<AppVector> {
  TextEditingController _controladorCantidad = TextEditingController();
  String _tipoSeleccionado = 'Enteros';
  List<double> _numerosAleatorios = [];

  void _generarNumerosAleatorios() {
    setState(() {
      _numerosAleatorios.clear();

      int cantidad = int.tryParse(_controladorCantidad.text) ?? 0;

      for (int i = 0; i < cantidad; i++) {
        double numeroAleatorio;
        if (_tipoSeleccionado == 'Enteros') {
          
          numeroAleatorio = Random().nextInt(100) + 1.toDouble();
        } else {

          numeroAleatorio = Random().nextDouble()+ Random().nextInt(100).toDouble();
        }
        _numerosAleatorios.add(numeroAleatorio);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vector'),
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
              icon: Icon(Icons.line_axis),
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
                controller: _controladorCantidad,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingrese la cantidad de números',
                ),
              ),
              DropdownButton<String>(
                value: _tipoSeleccionado,
                onChanged: (String? valor) {
                  setState(() {
                    _tipoSeleccionado = valor ?? 'Enteros';
                  });
                },
                items: ['Enteros', 'Decimales'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _generarNumerosAleatorios,
                child: Text('Generar Números Aleatorios'),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _numerosAleatorios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        _numerosAleatorios[index].toStringAsFixed(2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
