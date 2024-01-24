import 'package:expansion_stepper/src/model/stepper_children.dart';
import 'package:expansion_stepper/src/widgets/common/dot_provider.dart';
import 'package:htkc_utils/htkc_utils.dart';

class HorizontalStepperItem extends StatelessWidget {
  /// Stepper Item to show horizontal stepper
  const HorizontalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barHeight,
      required this.iconHeight,
      required this.iconWidth})
      : super(key: key);

  /// Stepper item of type [StepperChildren] to inflate stepper with data
  final StepperChildren item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar height/thickness
  final double barHeight;

  /// Height of [StepperChildren.iconWidget]
  final double iconHeight;

  /// Width of [StepperChildren.iconWidget]
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: item.isEmergent?Emergent(
        style: EmergentStyle(
          color: item.color,
          border: item.border,
          shape: item.shape,
          lightSource: item.lightSource,
          depth: item.depth,
        ),
        child: Padding(
          padding: item.padding!,
          child: GestureDetector(
            onTap: item.onTap,
            child: Column(
              children: [
                item.topContent!,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: isInverted ? getInvertedChildren() : getChildren(),
                ),
                item.bottomContent!,
              ],
            ),
          ),
        ),
      ):Padding(
        padding: item.padding!,
        child: GestureDetector(
          onTap: item.onTap,
          child: Column(
            children: [
              item.topContent!,
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: isInverted ? getInvertedChildren() : getChildren(),
              ),
              item.bottomContent!,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    return [
      if (item.title != null) ...[
        SizedBox(
          child: item.title,
        ),
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        SizedBox(
          child: item.subtitle,
        ),
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          Flexible(
            child: Container(
              color: index == 0
                  ? Colors.transparent
                  : (index <= activeIndex ? activeBarColor : inActiveBarColor),
              height: barHeight,
            ),
          ),
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            totalLength: totalLength,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
          ),
          Flexible(
            child: Container(
              color: index == totalLength - 1
                  ? Colors.transparent
                  : (index < activeIndex ? activeBarColor : inActiveBarColor),
              height: barHeight,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
