import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int count = 0;
  int n = 9;
  int f = 0;
  int s = 1;
  int series = 0;

  fibonacciSecuence() {
    while (count <= n) {
      if (count <= 1) {
        print(count);
      } else {
        series = f + s;
        f = s;
        s = series;
        print(series);
      }
      count += 1;
    }
  }
}
