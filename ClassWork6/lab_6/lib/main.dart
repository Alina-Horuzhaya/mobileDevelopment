import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // определяем с какого маршрута (страницы) будет открываться приложение
    initialRoute: '/', 
    routes: {
      '/':(BuildContext context) => const MainScreen(), // выбираем первый маршрут (страницу)
    },
  ));
}

//класс первого маршрута (страницы)
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Возвращение значения')),
      //кнопка перехода ко второму маршруту (странице)
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            // переход ко второму маршруту при помощи Push
            var result = await Navigator.push<String>(context, MaterialPageRoute(builder: (context) => const SecondScreen(),));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar (content: Text('$result'), backgroundColor: Colors.black,)
              );
          },
          child: const Text('Приступить к работе'),
        ),
      ),
    );
  }
}

//класс второго маршрута (страницы)
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  
// результаты при нажатии кнопок
  final String but_yes = 'Да!';
  final String but_no = 'Нет!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите любой вариант')),
      // расположение в центре двух кнопок
      body: Center(
        child:(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //кнопка с результатом "да" 
              //Pop возвращает нас к первому маршруту (странице) -> приступить к работе
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,but_yes);
                },
                child: Text(but_yes),
              ),

              //кнопка с результатом "нет"
              // аналогично 
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,but_no);
                },
                child: Text(but_no),
              ),
            ],
          )
        ) ),
    );
  }
}