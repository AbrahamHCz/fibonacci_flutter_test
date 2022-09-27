import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.08;
    double width = MediaQuery.of(context).size.width * 0.08;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Matriz de Fibonacci",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$one",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "$two",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "$three",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$four",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "$five",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "$six",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$seven",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "$eight",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "$nine",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Suma de matriz: $suma",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 45,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Elemento inicial: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 60,
                          width: 275,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            validator: (elementoInicialValue) {
                              if (elementoInicialValue == null ||
                                  elementoInicialValue.isEmpty ||
                                  elementoInicialValue == "0") {
                                return 'Por favor ingrese un valor mayor o igual a 1';
                              }
                              elementoInicial = elementoInicialValue;
                              return null;
                            },
                          ),
                        ),
                        const Text(
                          "Elemento final: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 60,
                          width: 275,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            validator: (elementoFinalValue) {
                              if (elementoFinalValue == null ||
                                  elementoFinalValue.isEmpty ||
                                  elementoFinalValue == "0") {
                                return 'Por favor ingrese un valor mayor o igual a 1';
                              } else if (elementoFinalValue == elementoFinal) {
                                return 'Por favor ingrese un valor diferente al valor inicial';
                              }
                              elementoFinal = elementoFinalValue;
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: suma == 0
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  generarMatriz();
                                }
                              }
                            : null,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: const Text("Generar matriz"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: suma != 0
                      ? () {
                          rotateMatrix();
                        }
                      : null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      suma == 0 ? Colors.grey : Colors.blue,
                    ),
                  ),
                  child: const Text("Rotar a la derecha"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      elementoInicial == null ? Colors.grey : Colors.blue,
                      // matrizFibonacci!.isEmpty ? Colors.grey : Colors.blue,
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

  dynamic elementoInicial;
  dynamic elementoFinal;
  List<int>? secuenciaFibo = [];
  // matriz 3x3 servira para tomar los datos de la matriz 3x3 grafica
  List<List<int>>? matrizFibonacci =
      List.generate(3, (index) => [], growable: true);

  int? one = 0;
  int? two = 0;
  int? three = 0;
  int? four = 0;
  int? five = 0;
  int? six = 0;
  int? seven = 0;
  int? eight = 0;
  int? nine = 0;

  int? suma = 0;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static List<int> generarSecuenciaFibo(int inicio, int maximo) {
    List<int>? secuenciaFibo = [];

    int primerTermino = inicio;
    int segundoTermino = numeroSiguienteFibo(inicio);

    int siguienteTermino = primerTermino + segundoTermino;
    secuenciaFibo.add(primerTermino);

    while (maximo >= segundoTermino) {
      secuenciaFibo.add(segundoTermino);

      primerTermino = segundoTermino;
      segundoTermino = siguienteTermino;
      siguienteTermino = primerTermino + segundoTermino;
    }

    return secuenciaFibo;
  }

  static int numeroAnteriorDeFibo(int n) {
    double a = n / ((1 + sqrt(5)) / 2.0);
    return (a.round());
  }

  static int numeroSiguienteFibo(int n) {
    double a = n * (1 + sqrt(5)) / 2.0;
    return (a.round());
  }

  static bool esCuadradoPerfecto(int x) {
    int s = sqrt(x).toInt();
    return (s * s == x);
  }

  static bool esNumeroFibonacci(int n) {
    return esCuadradoPerfecto(5 * n * n + 4) ||
        esCuadradoPerfecto(5 * n * n - 4);
  }

  List<List<int>> matriz = List.generate(3, (index) => [], growable: true);

  generarMatriz() {
    setState(
      () {
        List<int>? secuenciaFibo = [];
        // retorna true si el numero digitado pertenece a un termino de la secuencia
        // fibo
        bool encontroNumeroFibo = false;

        encontroNumeroFibo = esNumeroFibonacci(int.parse(elementoInicial));

        int primerTermino = 0;
        int segundoTermino = 1;
        int siguienteTermino = 0;

        if (encontroNumeroFibo) {
          // numero digitado SI pertenece a un termino de la secuancia fibo, empezara
          // desde este
          secuenciaFibo = generarSecuenciaFibo(
              int.parse(elementoInicial), int.parse(elementoFinal));
        } else {
          // numero introducido no es un termino de la secuencia fibo, se encuentra el
          // siguiente mayor que si es termino
          // entra al bucle si el numero digitado no es un termino de la secuencia fibo
          bool encontroTermino = false;
          int numeroFiboEncontrado = 0;

          while (!encontroTermino) {
            if (siguienteTermino >= int.parse(elementoInicial)) {
              numeroFiboEncontrado = siguienteTermino;
              encontroTermino = true;
            } else {
              siguienteTermino = primerTermino + segundoTermino;
              primerTermino = segundoTermino;
              segundoTermino = siguienteTermino;
            }
          }

          secuenciaFibo = generarSecuenciaFibo(
              numeroFiboEncontrado, int.parse(elementoFinal));
        }

        print(
            "SE GENERO LA SIGUIENTE SECUENCIA EN BASE A LOS PARAMETROS $elementoInicial y $elementoFinal");
        print(secuenciaFibo.toString());

        // si el numero de terminos encontrados en la secuencia es mayor al limite de la
        // matriz 3x3, mostrar error
        if (secuenciaFibo.length > 9 || secuenciaFibo.length < 9) {
          print("NUMERO DE TERMINOS EXCEDE CAPACIDAD DE LA MATRIZ...");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Error!",
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  "El numero de terminos excede o es menor a la capacidad total de la matriz",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Continuar"),
                  ),
                ],
              );
            },
          );
        } else {
          int conta = 0;

          for (int fila = 0; fila < 3; fila++) {
            for (int columna = 0; columna < 3; columna++) {
              if (conta < secuenciaFibo.length) {
                matriz[fila].add(secuenciaFibo[conta]);

                conta++;
                // matriz[columna].add(secuenciaFibo[conta]);
              }
            }
          }
          matrizFibonacci = matriz;

          for (int j = 0; j < matrizFibonacci!.length; j++) {}
          print("SE GENERO LA SIGUIENTE MATRIZ");
          print(matriz);

          one = matrizFibonacci![0][0];
          two = matrizFibonacci![0][1];
          three = matrizFibonacci![0][2];
          four = matrizFibonacci![1][0];
          five = matrizFibonacci![1][1];
          six = matrizFibonacci![1][2];
          seven = matrizFibonacci![2][0];
          eight = matrizFibonacci![2][1];
          nine = matrizFibonacci![2][2];

          suma = one! +
              two! +
              three! +
              four! +
              five! +
              six! +
              seven! +
              eight! +
              nine!;
        }
      },
    );
  }

  static void rotarMatriz(List<List<int>>? a) {
    for (int i = 0; i < a!.length / 2; i++) {
      for (int j = i; j < a[i].length - i - 1; j++) {
        int temp = a[i][j];
        a[i][j] = a[a.length - 1 - j][i];
        a[a.length - 1 - j][i] = a[a.length - 1 - i][a.length - 1 - j];
        a[a.length - 1 - i][a.length - 1 - j] = a[j][a.length - 1 - i];
        a[j][a.length - 1 - i] = temp;
      }
    }
  }

  rotateMatrix() {
    setState(() {
      rotarMatriz(matrizFibonacci);
      for (int j = 0; j < matrizFibonacci!.length; j++) {}
      print("SE GENERO LA SIGUIENTE MATRIZ ROTADA");
      print(matriz);

      one = matrizFibonacci![0][0];
      two = matrizFibonacci![0][1];
      three = matrizFibonacci![0][2];
      four = matrizFibonacci![1][0];
      five = matrizFibonacci![1][1];
      six = matrizFibonacci![1][2];
      seven = matrizFibonacci![2][0];
      eight = matrizFibonacci![2][1];
      nine = matrizFibonacci![2][2];

      suma =
          one! + two! + three! + four! + five! + six! + seven! + eight! + nine!;
    });
  }
}
