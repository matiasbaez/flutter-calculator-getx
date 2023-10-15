
import 'package:get/get.dart';

class CalculatorController extends GetxController {

  var firstNumber  = '0'.obs;
  var secondNumber = '0'.obs;
  var mathResult   = '0'.obs;
  var operation    = '+'.obs;

  reset() {
    firstNumber.value   = '0';
    secondNumber.value  = '0';
    mathResult.value    = '0';
    operation.value     = '+';
  }

  addNumber( String number ) {
    if ( mathResult.value == '0' ) return mathResult.value = number;
    if ( mathResult.value == '-0' ) return mathResult.value = '-$number';
    return mathResult.value = mathResult.value + number;
  }

  toggleNumberSign() {
    if ( mathResult.startsWith('-') ) return mathResult.value = mathResult.value.replaceFirst('-', '');
    return mathResult.value = '-${mathResult.value}';
  }

  addDecimalPoint() {
    if ( mathResult.contains('.') ) return;
    if ( mathResult.startsWith('0') ) return mathResult.value = '0.';
    return mathResult.value = mathResult.value + '.';
  }

  setOperation( String nOperation ) {
    operation.value = nOperation;
    if ( firstNumber.value == '0' ) firstNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  removeLastNumber() {
    if ( mathResult.value.replaceAll('-', '').length > 1 ) return mathResult.value = mathResult.value.substring( 0,  mathResult.value.length -1 );
    return  mathResult.value = '0';
  }

  calculateResult() {
    double number1 = double.parse(firstNumber.value);
    double number2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = '${ number1 + number2 }';
        break;

      case '-':
        mathResult.value = '${ number1 - number2 }';
        break;

      case '/':
        mathResult.value = '${ number1 / number2 }';
        break;

      case 'x':
        mathResult.value = '${ number1 * number2 }';
        break;
    }

    if ( mathResult.value.endsWith('.0') ) return mathResult.value = mathResult.value.substring(0, mathResult.value.length - 2);
    return mathResult.value;

  }

}
