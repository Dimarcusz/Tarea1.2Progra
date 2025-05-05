import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String resultado = "";

  bool esPalindromo(String texto) {
    String textoLimpio = texto.toLowerCase().replaceAll(RegExp(r'[\W_]'), '');
    return textoLimpio == textoLimpio.split('').reversed.join('');
  }

  void verificarPalindromo() {
    setState(() {
      resultado = esPalindromo(_controller.text)
          ? "Es un palíndromo"
          : "No es un palíndromo";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificador de Palíndromos"),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Introduce una palabra para verificar si es un palíndromo",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verificarPalindromo,
              child: const Text("Verificar"),
            ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
