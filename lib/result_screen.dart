import 'package:flutter/material.dart';


class ResultScreen extends StatefulWidget {
  final String text;

  const ResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<String> results = [];

  @override
  void initState() {
    super.initState();
    results.add(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados Escaneados'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Resultado ${index + 1}'),
              subtitle: Text(results[index]),
            ),
          );
        },
      ),
    );
  }
}
