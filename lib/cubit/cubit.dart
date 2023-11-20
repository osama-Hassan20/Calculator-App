
import 'package:calculator_app/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() :super(InitialStates());

  static CalculatorCubit get(context) => BlocProvider.of(context);

  dynamic input = "0";
  var output = '0';
  var lastAnswer = '';
  final List<dynamic> buttons = const [
    "00",
    "0",
    ".",
    "Ans",
    "=",
    "1",
    "2",
    "3",
    "+",
    "-",
    "4",
    "5",
    "6",
    "x",
    "÷",
    "7",
    "8",
    "9",
    "%",
    "^",
    "√",
    "e",
    "sin",
    "cos",
    "tan",
    "AC",
    "C",
  ];

  void handleButtonPress(var buttonText) {
    if (buttonText == 'AC') {
      clear();
    } else if (buttonText == "C") {
      deleteLastCharacter();
    } else if (buttonText == '=') {
      evaluateExpression();
    }else if (buttonText == 'Ans') {
      lastAns();
    } else {
      appendToInput(buttonText);
    }

    emit(HandleButtonPressStates());
  }

  String? decimalRemove(String result){
    if(result.contains('.')){
      List<String> split = result.split('.');

      if(!(int.parse(split[1]) > 0)) {
        return split[0];
      }
    }
    return result;
  }


  void lastAns() {
    appendToInput(lastAnswer);
    emit(LastAnsStates());
  }

  void clear() {
    lastAnswer = output;
    input = '0';
    output = '0';

    emit(ClearStates());
  }

  void deleteLastCharacter() {

    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }

    emit(DeleteLastCharacterStates());
  }

  void appendToInput(var value) {

    if(input == '0') {
      input = value;
    } else {
      input = input + value;
    }

    emit(AppendToInputStates());
  }

  void evaluateExpression() {
    try {
      String userQuestion = input;
      userQuestion = userQuestion.replaceAll("x", "*");
      userQuestion = userQuestion.replaceAll("÷", "/");
      userQuestion = userQuestion.replaceAll("√", "sqrt");
      Expression exp = Parser().parse(userQuestion);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      output = decimalRemove(eval.toString())!;
      lastAnswer = output;
    } catch (e) {
      emit(EvaluateExpressionErrorStates());
      if (kDebugMode) {
        print(e.toString());
      }
    }

    emit(EvaluateExpressionStates());
  }


}