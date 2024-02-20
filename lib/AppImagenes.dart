import 'AppVector.dart';
import 'AppFactorial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppImagenes());
}

class AppImagenes extends StatefulWidget {
  @override
  _AppImagenesState createState() => _AppImagenesState();
}

class _AppImagenesState extends State<AppImagenes> {
  PageController _pageController=PageController();
  int _currentIndex = 0;
  List<String> _imagenes = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _cambiarImagen(bool adelante) {
    setState(() {
      if (adelante) {
        _currentIndex = (_currentIndex + 1) % _imagenes.length;
      } else {
        _currentIndex = (_currentIndex - 1 + _imagenes.length) % _imagenes.length;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GALERIA'),
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
          
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'GALERIA',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: _imagenes.length,
                controller: _pageController,
                onPageChanged: (int index) {
              
                },
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Image.asset(
                      'assets/${_imagenes[index]}',
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () => _cambiarImagen(false),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () => _cambiarImagen(true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
