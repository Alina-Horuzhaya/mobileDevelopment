import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инкремент',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Инкремент'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

//функция для "-"
  void _decreaseCounter() {
    setState(() {

      _counter--;
    });
  }

//функция для "+"
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

//функция для сброса значения
  void _reset() {
    setState(() {
      
      _counter = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text ('Значение инкремента:', style: TextStyle(fontSize: 22)),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget> [
              FlatButton(onPressed: _decreaseCounter, child: const Icon(Icons.remove), color: Colors.red,),
              FlatButton(onPressed: _incrementCounter, child: const Icon(Icons.add), color: Colors.green,),
            ]),

              FlatButton(onPressed: _reset, child: Text ('Сбросить', style: TextStyle(fontSize: 16),), textColor: Colors.grey,),
            ], 
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
