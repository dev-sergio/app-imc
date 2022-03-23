import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetaCampos(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaImc(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      if(imc < 18.6){
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 39.9){
        _infoText = "Obesidade grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(
              onPressed: _resetaCampos,
              icon: const Icon(Icons.refresh)
          )
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline,
                  size: 120.0, color: Colors.amberAccent),
              TextFormField(
                controller: pesoController,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(
                    color: Colors.amberAccent,
                  ),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if(value!.isEmpty){
                    return "insira seu peso!";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: alturaController,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    color: Colors.amberAccent,
                  ),
                ),
                textAlign: TextAlign.center,
                validator: (value) {
                  if(value!.isEmpty){
                    return "insira sua altura!";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xffffd740)),
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        _calculaImc();
                      }
                    },
                    child: const Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
