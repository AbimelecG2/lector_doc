import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> texts; // Ahora acepta una lista de textos

  const ResultScreen({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: ListView.builder(
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Documento ${index + 1}'),
              onTap: () => _showScannedText(context, texts[index]),
            ),
          );
        },
      ),
    );
  }

  void _showScannedText(BuildContext context, String text) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(text),
          ),
        );
      },
    );
  }
}
