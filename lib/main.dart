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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.person_outline,
                size: 120.0, color: Colors.amberAccent),
            const TextField(
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (Kg)",
                labelStyle: TextStyle(
                  color: Colors.amberAccent,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const TextField(
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(
                  color: Colors.amberAccent,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: const Color(0xffffd740)),
                  onPressed: () {},
                  child:
                      const Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                ),
              ),
            ),
            const Text("Info",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            )
          ],
        ),
      ),
    );
  }
}
