import 'package:flutter/material.dart';
import 'dart:math';


class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i) {
      print('num $i : нечетное = ${i.isOdd}');
      final int index = i ~/ 2;

      if(i.isOdd) return new Divider(
        color: Colors.grey,
      );

      index.toDouble();
      num x = pow(2, index);
      return Text('2' ' ^ ' '$index' ' ' '=' ' $x', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, height: 3.0),);
    });
  }
}

void main() =>  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Список элементов',
        theme: ThemeData(primarySwatch: Colors.green,),
        home: Scaffold(appBar: AppBar(title: const Text("Список элементов"),),
          body: Center(child: MyBody(),))
    )
);

