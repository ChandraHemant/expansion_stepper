import 'package:flutter/material.dart';

class StepperDot extends StatelessWidget {
  /// Default stepper dot
  const StepperDot({
    Key? key,
    required this.index,
    required this.totalLength,
    required this.activeIndex,
  }) : super(key: key);

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final color = (index <= activeIndex) ? Colors.blue : Colors.grey;
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
        height: 14,
        width: 14,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: color,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
