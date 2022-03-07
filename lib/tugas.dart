import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  double C = 0;
  double K = 0;
  double R = 0;

  void Convert() {
    setState(() {
      double C = double.parse(etInput.text);
      R = 0.8 * C;
      K = C + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Konversi suhu - 2031710062 Rachma Novita Anggreani",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konverter Suhu - 2031710062 Rachma Novita Anggreani'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(etInput: etInput),
              SizedBox(
                height: 100,
                width: 100,
              ),
              Result(),
              Result1(K: K, R: R),
              SizedBox(
                height: 200,
                width: 250,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: Convert,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text('Konversi Suhu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
      keyboardType: TextInputType.number,
    );
  }
}

class Result1 extends StatelessWidget {
  const Result1({
    Key? key,
    required this.K,
    required this.R,
  }) : super(key: key);

  final double K;
  final double R;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$K', style: TextStyle(fontSize: 30)),
        SizedBox(
          width: 300,
          height: 100,
        ),
        Text('$R', style: TextStyle(fontSize: 30))
      ],
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Suhu dalam Kelvin'),
        SizedBox(
          width: 200,
        ),
        Text('Suhu dalam Reamor'),
      ],
    );
  }
}