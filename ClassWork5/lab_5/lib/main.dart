import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override 
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _widthController = TextEditingController(); // проверка ширины
  final TextEditingController _heightController = TextEditingController(); // проверка высоты
  int _width = 0; // перемнная ширины
  int _height = 0; // переменная высоты
  int S = 0; // переменная расччитанной площади
  String buttonText = "Задайте параметры";
  bool isChanged = false;

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
// строка параметра "ширина"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10), 
                    child: const Text(
                      'Ширина (мм):',
                      style: TextStyle(fontSize: 14.2),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: TextFormField(
                      validator: (value) {
                        //валидация введенного параметра ширины
                        if (value!.isEmpty) {
                          return 'Задайте ширину';
                        }

                        if (value == '0') return 'Введите значение > 0';
                        if (int.parse(value) < 0) return 'Введите неотрицательное значение';

                        isChanged == false;
                        return null;
                      },
                      controller: _widthController,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
//разделение строк
              const SizedBox(
                height: 15.0,
              ),

//строка параметра "высота"
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Высота (мм):',
                      style: TextStyle(fontSize: 14.2),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: TextFormField(
                      validator: (value) {
                        //валидация введенного параметра высоты
                        if (value!.isEmpty) {
                          return 'Задайте высоту';
                        }

                        if (value == '0') return 'Введите значение > 0';
                        if (int.parse(value) < 0) return 'Введите неотрицательное значение';

                        isChanged == false;
                        return null;
                      },
                      controller: _heightController,
                      onChanged: (value) {},
                    ),
                  ),
                ],
            ),
// разделение строки параметра "высота" и кнопки "рассчитать"
            const SizedBox(
              height: 10.0,
            ),
//кнопка рассчета площади
            Align(
              child: ElevatedButton(
                onPressed: () {
                  //если все введенные параметры прошли валидацию
                  if (_formKey.currentState!.validate()) {
                    _width = int.tryParse(_widthController.text)!;
                    _height = int.tryParse(_heightController.text)!;

                    S = (_width * _height);
                    isChanged = !isChanged;
                    isChanged == true
                    //вывод текста под кнопкой
                    ? buttonText = "Задайте параметры"
                    : buttonText = "S = $_width * $_height = $S (мм^2)";
                  } else {}

                  setState(() {});
                },

                child: const Text('Вычислить',
                  style: TextStyle(color: Colors.white)),
              ),
            ),

            const SizedBox(height: 5.0),
            Text(
              buttonText,
              style: const TextStyle(fontSize: 25),
            )
          ],
          ),
        ),
      ),
    );
  }
}


void main() =>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Калькулятор площади')),
      body: const MyForm()
    )
  )
);