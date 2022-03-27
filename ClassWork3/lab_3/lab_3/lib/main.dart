import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
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
  int count = 0;
  bool addlike = false;

//счетчик "лайков"
  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
        Image.asset(
          'assets/photo.jpg',
          fit: BoxFit.cover,
          height: 220,
          width: 420,
        ),      
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Общежитие №20",
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight:  FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Краснодар, ул. Калинина, 13',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style:TextStyle(
                    color: Colors.grey
                  ),
                ),
              ],
            ),
            
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (addlike) {
                        count--;
                      } else {
                        count++;
                      }
                      addlike = !addlike;
                    });
                  },
                  
                  icon: Icon(
                    addlike ? Icons.favorite: Icons.favorite_border,
                    color: Colors.red),
                ),

              Text(
                '$count',
                style: TextStyle(color: Colors.black),
              ),
            ])
          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.call, color: Colors.green, size: 26)),
              
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.near_me, color: Colors.green, size:26)),
            
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.share, color: Colors.green, size: 26)),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('ПОЗВОНИТЬ',
            style: TextStyle( fontSize: 10, color: Colors.green)),
            Text('МАРШРУТ',
            style: TextStyle( fontSize: 10, color: Colors.green)),
            Text('ПОДЕЛИТЬСЯ',
            style: TextStyle( fontSize: 10, color: Colors.green)),
          ],
        ),

      Container(
        margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Text("Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.",
          textAlign: TextAlign.left,
        ),
      ),
    ],
      ),
    );
  }
}
