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
      home: const ControleEstoque(),
    );
  }
}

class ControleEstoque extends StatefulWidget {
  const ControleEstoque({super.key});

  @override
  State<ControleEstoque> createState() => _ControleEstoqueState();
}

class _ControleEstoqueState extends State<ControleEstoque> {
  final TextEditingController quantidadeController =
      TextEditingController();

  int estoque = 0;
  String mensagem = '';

  void entrada() {
    int? quantidade = int.tryParse(quantidadeController.text);

    if (quantidade != null && quantidade > 0) {
      setState(() {
        estoque = estoque + quantidade;
        mensagem = 'Entrada realizada com sucesso.';
      });
    } else {
      setState(() {
        mensagem = 'Digite uma quantidade válida.';
      });
    }
  }

  void saida() {
    int? quantidade = int.tryParse(quantidadeController.text);

    if (quantidade != null && quantidade > 0) {
      setState(() {
        if (quantidade <= estoque) {
          estoque = estoque - quantidade;
          mensagem = 'Saída realizada com sucesso.';
        } else {
          mensagem = 'Erro: quantidade solicitada maior que o estoque.';
        }
      });
    } else {
      setState(() {
        mensagem = 'Digite uma quantidade válida.';
      });
    }
  }

  void limparCampo() {
    setState(() {
      quantidadeController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Estoque'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Quantidade atual em estoque: $estoque',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: entrada,
                  child: const Text('Entrada'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: saida,
                  child: const Text('Saída'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: const Text('Limpar campo'),
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