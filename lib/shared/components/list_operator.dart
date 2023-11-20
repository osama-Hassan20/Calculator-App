bool isOperator(String x) {
  if (x == "%" ||
      x == "÷" ||
      x == "x" ||
      x == "-" ||
      x == "sin" ||
      x == "cos" ||
      x == "tan" ||
      x == "e" ||
      x == "√" ||
      x == "+" ||
      x == "=" ||
      x == "^") {
    return true;
  }
  return false;
}