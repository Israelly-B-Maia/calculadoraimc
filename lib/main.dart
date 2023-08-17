import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 174, 2, 2)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultado_imc = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/IMC.png', 
            width: MediaQuery.of(context).size.width, 
            fit: BoxFit.cover, 
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Calculadora de IMC',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: controllerPeso,
                  decoration: const InputDecoration(
                    labelText: 'peso',
                    hintText: 'Digite o seu peso',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: controllerAltura,
                  decoration: const InputDecoration(
                    labelText: 'altura',
                    hintText: 'Digite sua altura',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  resultado_imc,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num numAux = (num.parse(controllerPeso.text) /
                            (num.parse(controllerAltura.text) * num.parse(controllerAltura.text)));
                        resultado_imc = numAux.toStringAsFixed(2);
                      });
                    },
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resultado_imc = '';
                    });
                  },
                  child: Text('Limpar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
