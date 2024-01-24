import 'package:expansion_stepper/src/model/stepper_children.dart';
import 'package:expansion_stepper/src/utils/utils.dart';
import 'package:expansion_stepper/src/widgets/common/stepper_dot_widget.dart';
import 'package:flutter/material.dart';

class DotProvider extends StatelessWidget {
  const DotProvider(
      {Key? key,
      required this.index,
      required this.activeIndex,
      required this.item,
      required this.totalLength,
      this.iconHeight,
      this.iconWidth})
      : super(key: key);

  /// Stepper item of type [StepperChildren] to inflate stepper with data
  final StepperChildren item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Height of [StepperChildren.iconWidget]
  final double? iconHeight;

  /// Width of [StepperChildren.iconWidget]
  final double? iconWidth;

  @override
  Widget build(BuildContext context) {
    return index <= activeIndex
        ? SizedBox(
            height: iconHeight,
            width: iconWidth,
            child: item.iconWidget ??
                StepperDot(
                  index: index,
                  totalLength: totalLength,
                  activeIndex: activeIndex,
                ),
          )
        : item.iconWidget != null
            ? SizedBox(
                height: iconHeight,
                width: iconWidth,
                child: item.iconWidget ??
                    StepperDot(
                      index: index,
                      totalLength: totalLength,
                      activeIndex: activeIndex,
                    ),
              )
            : ColorFiltered(
                colorFilter: Utils.getGreyScaleColorFilter(),
                child: SizedBox(
                  height: iconHeight,
                  width: iconWidth,
                  child: item.iconWidget ??
                      StepperDot(
                        index: index,
                        totalLength: totalLength,
                        activeIndex: activeIndex,
                      ),
                ),
              );
  }
}
