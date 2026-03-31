import 'package:flutter/material.dart';
import 'package:flutter_page_turn/flutter_page_turn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ExamplePage());
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Turn Example")),

      body: PageTurnView.builder(
        controller: PageTurnController(),
        itemCount: 30,
        effect: PageTurnEffect.slide,
        // autoPlay: true,
        autoPlayDelay: const Duration(seconds: 1),
        axis: Axis.horizontal,
        // infinite: true,
        // autoPlay: true,
        showIndicator: true,

        itemBuilder: (context, index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                "Page ${index + 1}",
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
