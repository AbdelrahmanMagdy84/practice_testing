class Calculator {
  Calculator._privateConstructor();
  static final Calculator _instance = Calculator._privateConstructor();
  factory Calculator() {
    return _instance;
  }
  double multiplication(double first, double second) {
    return first * second;
  }

  double adding(double first, double second) {
    return first + second;
  }
}
