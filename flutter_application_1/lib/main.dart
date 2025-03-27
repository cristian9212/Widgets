import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo de Widgets',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  String userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets en Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Hola, ingresa un comentario. Gracias.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const ImageDisplayWidget(), // Widget personalizado para la imagen
            const SizedBox(height: 20),
            TextInputWidget(
              onTextChanged: (value) {
                setState(() {
                  userInput = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Texto ingresado: $userInput')),
                );
              },
              child: const Text('Mostrar texto'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget separado para la imagen
class ImageDisplayWidget extends StatelessWidget {
  const ImageDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
      height: 100,
    );
  }
}

// Widget separado para el campo de texto
class TextInputWidget extends StatelessWidget {
  final ValueChanged<String> onTextChanged;

  const TextInputWidget({super.key, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Escribe algo...',
        border: OutlineInputBorder(),
      ),
      onChanged: onTextChanged,
    );
  }
}
