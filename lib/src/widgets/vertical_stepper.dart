import 'package:expansion_stepper/expansion_stepper.dart';
import 'package:htkc_utils/htkc_utils.dart';

class VerticalStepperItem extends StatelessWidget {
  /// Stepper Item to show vertical stepper
  const VerticalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barWidth,
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

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness
  final double barWidth;

  /// Height of [StepperChildren.iconWidget]
  final double iconHeight;

  /// Width of [StepperChildren.iconWidget]
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: item.padding!,
      child: MaterialButton(
        onPressed: item.onTap,
        splashColor: item.onTapSplashColor,
        highlightColor: item.onTapHighlightColor,
        child: item.isEmergent ?
          Emergent(
            style: EmergentStyle(
              color: item.color,
              border: item.border,
              shape: item.shape,
              lightSource: item.lightSource,
              depth: item.depth,
            ),
            child: Column(
              children: [
                item.topContent!,
                Row(
                  children: isInverted ? getInvertedChildren() : getChildren(),
                ),
                item.bottomContent!,
              ],
            ),
          )
          :Column(
            children: [
              item.topContent!,
              Row(
                children: isInverted ? getInvertedChildren() : getChildren(),
              ),
              item.bottomContent!,
            ],
          ),
      ),
    );
  }

  List<Widget> getChildren() {
    return [
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            totalLength: totalLength,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
          ),
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment:
              isInverted ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (item.title != null) ...[
              item.title!,
            ],
            if (item.subtitle != null) ...[
              const SizedBox(height: 8),
              item.subtitle!,
            ],
          ],
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
