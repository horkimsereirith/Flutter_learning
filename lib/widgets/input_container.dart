import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final String label;
  final Widget input;
  // final double? widthPercentage;

  const InputContainer({
    Key? key,
    required this.label,
    required this.input,
    // this.widthPercentage = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // width: screenWidth.toDouble() * widthPercentage!.toDouble() / 100,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(children: [
        Text(label),
        input,
      ], crossAxisAlignment: CrossAxisAlignment.start),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
