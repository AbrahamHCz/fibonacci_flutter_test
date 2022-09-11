import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic elementoInicial;
  dynamic elementoFinal;
  List<int>? secuenciaFibo = [];

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static List<int> generarSecuenciaFibo(int inicio, int maximo) {
    List<int>? secuenciaFibo = [];

    int primerTermino = inicio;
    int segundoTermino = numeroSiguienteFibo(inicio);

    int siguienteTermino = primerTermino + segundoTermino;
    secuenciaFibo.add(primerTermino);

    while (maximo >= siguienteTermino) {
      secuenciaFibo.add(siguienteTermino);

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

  // matriz 3x3 servira para tomar los datos de la matriz 3x3 grafica
  List<List<int>>? matrizFibonacci;
  generarMatriz() {
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

      secuenciaFibo =
          generarSecuenciaFibo(numeroFiboEncontrado, int.parse(elementoFinal));
    }

    print(
        "SE GENERO LA SIGUIENTE SECUENCIA EN BASE A LOS PARAMETROS $elementoInicial y $elementoFinal");
    print(secuenciaFibo.toString());

    // si el numero de terminos encontrados en la secuencia es mayor al limite de la
    // matriz 3x3, mostrar error
    if (secuenciaFibo.length > 9) {
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
              "El numero de terminos excede la capacidad de la matriz. Se tomara hasta el elemento 9no",
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
    }

    int contadorPosicion = 0;

    // bucle recorre las filas 1 por 1
    for (int fila = 0; fila < 3; fila++) {
      // bucle para recorrer las columnas
      for (int columna = 0; columna < 3; columna++) {
        if (contadorPosicion >= secuenciaFibo.length) {
          // el numero de elementos de la secuencia no llena la matriz
          // se omite
          continue;
        } else {
          // se ingresa el sprimer termino
          matrizFibonacci?[fila][columna] = secuenciaFibo[contadorPosicion];
          // se suma el contador para llevar control de posiciones ya tomadas
          contadorPosicion++;
        }
      }
    }

    print("MATRIZ GENERADA:");
    for (int i = 0; i < matrizFibonacci!.length; i++) {
      for (int j = 0; j < matrizFibonacci![i].length; j++) {
        print(matrizFibonacci![i][j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.08;

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
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "0",
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
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "0",
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
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "0",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Elemento inicial: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 60,
                          width: 40,
                          child: TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            validator: (elementoInicialValue) {
                              if (elementoInicialValue == null ||
                                  elementoInicialValue.isEmpty) {
                                return '*Ingresar...';
                              }
                              elementoInicial = elementoInicialValue;
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        const Text(
                          "Elemento final: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 60,
                          width: 40,
                          child: TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            validator: (elementoFinalValue) {
                              if (elementoFinalValue == null ||
                                  elementoFinalValue.isEmpty) {
                                return '*Ingresar...';
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            generarMatriz();
                          }
                        },
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
                  onPressed: () {
                    if (matrizFibonacci!.isEmpty) {
                      Null;
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        matrizFibonacci!.isEmpty ? Colors.grey : Colors.blue),
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
                        matrizFibonacci!.isEmpty ? Colors.grey : Colors.blue),
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
