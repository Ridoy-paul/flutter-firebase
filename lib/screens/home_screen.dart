
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:const Text("Match Lists"),
      ),
      body: SafeArea(
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 8, left: 5, right: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: Colors.black12,
                  width: 1.0, // Border width
                ),
              ),
              child: ListTile(
                title: Text('Item 1'),
                subtitle: Text('Subtitle for Item $index'),
                trailing: const Icon(Icons.arrow_right_alt),
                onTap: () {
                  print("tab");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
