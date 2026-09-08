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
      home: const AntecessorSucessor(),
    );
  }
}

class AntecessorSucessor extends StatefulWidget {
  const AntecessorSucessor({super.key});

  @override
  State<AntecessorSucessor> createState() => _AntecessorSucessorState();
}

class _AntecessorSucessorState extends State<AntecessorSucessor> {
  final TextEditingController numeroController = TextEditingController();

  String mensagem = '';

  void calcular() {
    int? numero = int.tryParse(numeroController.text);

    setState(() {
      if (numero != null) {
        mensagem =
            'Número: $numero\n'
            'Antecessor: ${numero - 1}\n'
            'Sucessor: ${numero + 1}';
      } else {
        mensagem = 'Digite um número inteiro válido.';
      }
    });
  }

  void limpar() {
    setState(() {
      numeroController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Antecessor e Sucessor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um número',
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