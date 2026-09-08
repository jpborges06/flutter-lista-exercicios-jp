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
      home: const Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  String resultado = '';

  void somar() {
    double? numero1 = double.tryParse(numero1Controller.text);
    double? numero2 = double.tryParse(numero2Controller.text);

    setState(() {
      if (numero1 != null && numero2 != null) {
        resultado = 'Resultado: ${numero1 + numero2}';
      } else {
        resultado = 'Digite dois números válidos.';
      }
    });
  }

  void subtrair() {
    double? numero1 = double.tryParse(numero1Controller.text);
    double? numero2 = double.tryParse(numero2Controller.text);

    setState(() {
      if (numero1 != null && numero2 != null) {
        resultado = 'Resultado: ${numero1 - numero2}';
      } else {
        resultado = 'Digite dois números válidos.';
      }
    });
  }

  void multiplicar() {
    double? numero1 = double.tryParse(numero1Controller.text);
    double? numero2 = double.tryParse(numero2Controller.text);

    setState(() {
      if (numero1 != null && numero2 != null) {
        resultado = 'Resultado: ${numero1 * numero2}';
      } else {
        resultado = 'Digite dois números válidos.';
      }
    });
  }

  void dividir() {
    double? numero1 = double.tryParse(numero1Controller.text);
    double? numero2 = double.tryParse(numero2Controller.text);

    setState(() {
      if (numero1 != null && numero2 != null) {
        if (numero2 != 0) {
          resultado = 'Resultado: ${numero1 / numero2}';
        } else {
          resultado = 'Erro: não é possível dividir por zero.';
        }
      } else {
        resultado = 'Digite dois números válidos.';
      }
    });
  }

  void limpar() {
    setState(() {
      numero1Controller.clear();
      numero2Controller.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: numero2Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Segundo número',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: somar,
                  child: const Text('+'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: subtrair,
                  child: const Text('-'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: multiplicar,
                  child: const Text('×'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: dividir,
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: limpar,
              child: const Text('Limpar'),
            ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}