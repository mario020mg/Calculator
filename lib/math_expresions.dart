import 'package:math_expressions/math_expressions.dart';

class CalculatorMaths {
  Parser p = Parser();
  Expression expression;
  String string;

  CalculatorMaths(this.string) {
    expression = p.parse(string);
  }

  String getResults() {
    return expression.evaluate(EvaluationType.REAL, ContextModel()).toString();
  }
}
