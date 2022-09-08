import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix2d/matrix2d.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inicialElement = TextEditingController();
  final finalElement = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inicialElement.dispose();
    super.dispose();

    finalElement.dispose();
    super.dispose();
  }

  // int count = 0;

  // int n = 8;

  // int f = 0;

  // int s = 1;

  // int series = 0;

  // int one = 0;
  // int two = 0;
  // int three = 0;
  // int four = 0;
  // int five = 0;
  // int six = 0;
  // int seven = 0;
  // int eight = 0;
  // int nine = 0;

  // void fibonacciSecuence() {
  //   while (count <= n) {
  //     if (count <= 1) {
  //       print(count);
  //     } else {
  //       series = f + s;
  //       f = s;
  //       s = series;
  //       print(series);
  //     }
  //     count += 1;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.08;
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: height, left: 35, right: 35),
          color: Colors.white,
          child: Column(
            children: [
              const Text(
                "Matriz de Fibonacci",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 45,
              ),
              Wrap(
                children: [
                  for (int item in numbers)
                    Container(
                      height: 50,
                      width: 100,
                      child: Text(item.toString()),
                    )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Suma de matriz: ",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Elemento inicial: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 30,
                    height: 20,
                    child: TextField(
                      controller: inicialElement,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "Elemento final: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 30,
                    height: 20,
                    child: TextField(
                      controller: finalElement,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 400,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: const Text("Generar matriz"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: const Text("Rotar a la derecha"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: const Text("Limpiar Matriz"),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
