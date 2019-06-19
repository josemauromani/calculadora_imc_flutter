import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _infoText = "Informe seus dados para calcular";

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = "Informe seus dados para calcular";
    });
  }

  void calcula() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = (weight / (height * height));

    if (imc < 18.6) {
      setState(() {
        _infoText = "IMC ${imc} - Abaixo do Peso";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
        elevation: 10,
      ),
      backgroundColor: Colors.green[30],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green[500],
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  )),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green[500],
                fontSize: 20,
              ),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  )),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green[500],
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 50.0,
              child: RaisedButton(
                child: Text(
                  'Calcular IMC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  calcula();
                },
                color: Colors.green[500],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                _infoText,
                style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
