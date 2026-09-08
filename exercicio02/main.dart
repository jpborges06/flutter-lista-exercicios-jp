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
      home: const VerificadorIdade(),
    );
  }
}

class VerificadorIdade extends StatefulWidget {
  const VerificadorIdade({super.key});

  @override
  State<VerificadorIdade> createState() => _VerificadorIdadeState();
}

class _VerificadorIdadeState extends State<VerificadorIdade> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  String mensagem = '';

  void verificar() {
    int idade = int.tryParse(idadeController.text) ?? 0;

    setState(() {
      if (idade >= 18) {
        mensagem = '${nomeController.text} é maior de idade.';
      } else {
        mensagem = '${nomeController.text} é menor de idade.';
      }
    });
  }

  void limpar() {
    setState(() {
      nomeController.clear();
      idadeController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificador de Idade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Idade',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificar,
                  child: const Text('Verificar'),
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