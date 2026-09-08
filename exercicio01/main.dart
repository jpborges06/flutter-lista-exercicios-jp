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
      home: const IdentificacaoUsuario(),
    );
  }
}

class IdentificacaoUsuario extends StatefulWidget {
  const IdentificacaoUsuario({super.key});

  @override
  State<IdentificacaoUsuario> createState() => _IdentificacaoUsuarioState();
}

class _IdentificacaoUsuarioState extends State<IdentificacaoUsuario> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String mensagem = '';

  void mostrar() {
    setState(() {
      mensagem =
          'Olá, ${nomeController.text}! Você mora em ${cidadeController.text}.';
    });
  }

  void limpar() {
    setState(() {
      nomeController.clear();
      cidadeController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificação do Usuário'),
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
              controller: cidadeController,
              decoration: const InputDecoration(
                labelText: 'Cidade',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostrar,
                  child: const Text('Mostrar'),
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