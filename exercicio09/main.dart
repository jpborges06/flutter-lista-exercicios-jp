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
      home: const SistemaVendas(),
    );
  }
}

class SistemaVendas extends StatefulWidget {
  const SistemaVendas({super.key});

  @override
  State<SistemaVendas> createState() => _SistemaVendasState();
}

class _SistemaVendasState extends State<SistemaVendas> {
  final TextEditingController produtoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController =
      TextEditingController();

  String mensagem = '';

  void calcular() {
    double? preco = double.tryParse(precoController.text);
    int? quantidade = int.tryParse(quantidadeController.text);

    setState(() {
      if (preco != null && quantidade != null && quantidade >= 0) {
        double subtotal = preco * quantidade;
        double desconto = 0;

        if (subtotal > 500) {
          desconto = subtotal * 0.10;
        }

        double total = subtotal - desconto;

        mensagem =
            'Produto: ${produtoController.text}\n'
            'Quantidade: $quantidade\n'
            'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}\n'
            'Desconto: R\$ ${desconto.toStringAsFixed(2)}\n'
            'Total: R\$ ${total.toStringAsFixed(2)}';
      } else {
        mensagem = 'Digite valores válidos.';
      }
    });
  }

  void limpar() {
    setState(() {
      produtoController.clear();
      precoController.clear();
      quantidadeController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Vendas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: const InputDecoration(
                labelText: 'Produto',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Preço unitário',
              ),
            ),
            const SizedBox(height: 10),
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