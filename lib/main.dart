import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _userWeight = TextEditingController();
  TextEditingController _userHeight = TextEditingController();
  double imc = 0.0;
  String situation = '';


  void _maleCalc() {
    imc = double.parse(_userWeight.text)/(double.parse(_userHeight.text) * double.parse(_userHeight.text));
    
    if(double.parse(_userHeight.text) <=0 || double.parse(_userWeight.text) <=0 || double.tryParse(_userHeight.text) == null || double.tryParse(_userWeight.text) == null){
      situation = "Valor inválido";
      return;
    }

    setState(() {

     if(imc < 20.7) {
          situation = "Abaixo do peso";
        } else if(imc >= 20.7 || imc < 26.4) {
          situation = "Peso ideal";
        } else if(imc > 26.5 || imc < 27.8) {
          situation = "Pouco acima do peso";
        } else if(imc > 27.9 || imc < 31.1) {
          situation = "Acima do peso";
        } else if(imc <= 32.2) {
          situation = "Obesidade";
        } else {
          print("Não foi possível calcular seu IMC");
      }
    });
  }

    void _femaleCalc() {
      if(double.parse(_userHeight.text) <=0 || double.parse(_userWeight.text) <=0 || double.tryParse(_userHeight.text) == null || double.tryParse(_userWeight.text) == null){
        situation = "Valor inválido";
        return;
      }
      
      imc = double.parse(_userWeight.text)/(double.parse(_userHeight.text) * double.parse(_userHeight.text));

      setState(() {
        if(imc < 19.1) {
            situation = "Abaixo do peso";
          } else if(imc >= 19.1 || imc < 25.8) {
            situation = "Peso ideal";
          } else if(imc > 25.9 || imc < 27.3) {
            situation = "Pouco acima do peso";
          } else if(imc > 27.4 || imc < 32.3) {
            situation = "Acima do peso";
          } else if(imc <= 32.4) {
            situation = "Obesidade";
          } else {
            print("Não foi possível calcular seu IMC");
          }
    }); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Calculadora de IMC'),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Text('ARTHUR MENDES MARTINS / RA: 1431432312019'),
                  Text('NICOLE CARVALHO SOUZA / RA: 1431432312018'),
            SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Insira seu peso: ', style: TextStyle(fontSize: 18.0)),
                    SizedBox(width: 10),
                    Container(
                      width: 250,
                      child: TextField(
                          controller: _userWeight,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.zero)))),
                    ),
                    SizedBox(height: 10),
                    Text('Para 80 quilos, digite 80. Para 80 quilos e 300 gramas, digite 80.300', style: TextStyle(fontSize: 12.0)),
                    SizedBox(height: 20),
                    Text('Insira sua altura:', style: TextStyle(fontSize: 18.0)),
                    SizedBox(height: 10),
                    Container(
                      width: 250,
                      child: TextField(
                          controller: _userHeight,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.zero)))),
                    ),
                    SizedBox(height: 10),
                    Text('Para 1 metro e 70 centímetros, digite 1.70', style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    ElevatedButton(
                    onPressed: _maleCalc,
                    child: Text('Calcular IMC Masculino'),
                  ),
                  SizedBox(height: 10),
                    ElevatedButton(
                    onPressed: _femaleCalc,
                    child: Text('Calcular IMC Feminino'),
                  ),
                  ]
                  ),
            
            SizedBox(height: 20),
            Text(
              'Seu IMC é: ${imc}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
            ),
            Text(
              'Situação: ${situation}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
            ),
                ]
              )
            )
            
          ],
        ),
      ),
    );
  }
}
