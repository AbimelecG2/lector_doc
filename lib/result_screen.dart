import 'package:flutter/material.dart';
import 'package:lector_doc/main.dart';

class ResultScreen extends StatefulWidget {
  final String text;

  const ResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, String>> results = [];

  @override
  void initState() {
    super.initState();
    results.add({"title": "Scan 1", "text": widget.text});
  }

  Future<void> _editTitle(int index) async {
    TextEditingController _titleController = TextEditingController();
    _titleController.text = results[index]["title"] ?? "";

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Title'),
          content: TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Enter new title',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  results[index]["title"] = _titleController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          var result = results[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Card(
              child: ListTile(
                title: Text(result["title"] ?? "Untitled"),
                subtitle: Text(result["text"] ?? ""),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editTitle(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar lógica para escanear más texto y añadirlo a los resultados
          MainScreen();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
