
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calculator/controllers/controllers.dart';
import 'package:calculator/widgets/widgets.dart';

class MathResults extends StatelessWidget {

  const MathResults();

  @override
  Widget build(BuildContext context) {

    final calculatorCtrl = Get.find<CalculatorController>();

    return Obx(
      () => Column(
        children: [
          SubResult( text: '${ calculatorCtrl.firstNumber }' ),
          SubResult( text: '${ calculatorCtrl.operation }' ),
          SubResult( text: '${ calculatorCtrl.secondNumber }' ),
          LineSeparator(),
          MainResultText( text: '${ calculatorCtrl.mathResult }' ),
        ],
      )
    );
  }
}