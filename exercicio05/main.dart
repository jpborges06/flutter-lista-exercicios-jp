import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ConversorTemperatura(),
    );
  }
}

class ConversorTemperatura extends StatefulWidget {
  const ConversorTemperatura({super.key});

  @override
  State<ConversorTemperatura> createState() => _ConversorTemperaturaState();
}

class _ConversorTemperaturaState extends State<ConversorTemperatura> {
  final TextEditingController temperaturaController =
      TextEditingController();

  String mensagem = '';

  void converter() {
    double? celsius = double.tryParse(temperaturaController.text);

    setState(() {
      if (celsius != null) {
        double fahrenheit = (celsius * 9 / 5) + 32;
        mensagem =
            'Temperatura em Fahrenheit: ${fahrenheit.toStringAsFixed(1)} °F';
      } else {
        mensagem = 'Digite uma temperatura válida.';
      }
    });
  }

  void limpar() {
    setState(() {
      temperaturaController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    temperaturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: temperaturaController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Temperatura em Celsius',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: converter,
                  child: const Text('Converter'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limpar,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              mensagem,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}