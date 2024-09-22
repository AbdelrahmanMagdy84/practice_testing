import 'package:flutter_test/flutter_test.dart';
import 'package:project_to_practice_testing/features/first_feature/data/datasources/calculator.dart';

void main() {
  group("calculator group", () {
    group("addition group", () {
      test(
        "small numbers",
        () {
          //arrange
          var calculator = Calculator();
          var matcher = 133.0;
          //act
          var multiplicationOutput = calculator.adding(123, 10);
          //assert

          expect(multiplicationOutput, matcher);
        },
      );
    });
    group("multiplication group", () {
      test(
        "small numbers",
        () {
          //arrange
          var calculator = Calculator();
          //act
          var multiplicationOutput = calculator.multiplication(2, 10);
          //assert

          expect(multiplicationOutput, 20);
        },
      );
      test(
        "large numbers",
        () {
          //arrange
          var calculator = Calculator();
          //act
          var multiplicationOutput =
              calculator.multiplication(1238129389, 989098);
          //assert

          expect(multiplicationOutput, 1224631302401122);
        },
      );
    });
  });
}
