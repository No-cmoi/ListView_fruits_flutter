import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pommes Poires Ananas',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Pommes Poires Ananas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> _counters = [];

  void _incrementCounter() {
    setState(() {
      _counters.add(_counters.length);
    });
  }

  Color _getBackgroundColor(int number){
    return number % 2 == 0 ? Colors.indigo : Colors.cyan;
  }

  Color _getFloatingActionButtonColor(){
    if(_counters.isEmpty) {
      return Colors.orange;
    } else {
      return _counters.last % 2 == 0 ? Colors.indigo : Colors.cyan;
    }
  }

  bool _isPrime(int number) {
    if (number <= 1){
      return false;
    }
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  String _getImage(int number){
    if (_isPrime(number)){
      return 'images/ananas.png';
    } else if (number %2 == 0){
      return 'images/poire.png';
    } else {
      return 'images/pomme.png';
    }
  }

  String _currentValue(int number){
    if (_isPrime(number)){
      return 'nombre premier';
    } else if (number %2 == 0){
      return 'pair';
    } else {
      return 'impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: _counters.isNotEmpty ? Text(_currentValue(_counters.last)) : const Text('Pommes Poires Ananas'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _counters.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(_getImage(_counters[index])),
              title: Text('${_counters[index]}'),
              textColor: Colors.white,
              tileColor: _getBackgroundColor(_counters[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _getFloatingActionButtonColor(),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
