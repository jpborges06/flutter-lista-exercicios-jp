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
      home: const ConsumoCombustivel(),
    );
  }
}

class ConsumoCombustivel extends StatefulWidget {
  const ConsumoCombustivel({super.key});

  @override
  State<ConsumoCombustivel> createState() => _ConsumoCombustivelState();
}

class _ConsumoCombustivelState extends State<ConsumoCombustivel> {
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController combustivelController =
      TextEditingController();

  String mensagem = '';

  void calcular() {
    double? distancia = double.tryParse(distanciaController.text);
    double? combustivel = double.tryParse(combustivelController.text);

    setState(() {
      if (distancia != null && combustivel != null && combustivel > 0) {
        double consumo = distancia / combustivel;

        String classificacao;

        if (consumo >= 12) {
          classificacao = 'Econômico';
        } else {
          classificacao = 'Consumo elevado';
        }

        mensagem =
            'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n'
            'Classificação: $classificacao';
      } else {
        mensagem = 'Digite valores válidos.';
      }
    });
  }

  void limpar() {
    setState(() {
      distanciaController.clear();
      combustivelController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    distanciaController.dispose();
    combustivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de Combustível'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Distância em km',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: combustivelController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Combustível em litros',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: const Text('Calcular'),
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