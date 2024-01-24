import 'package:htkc_utils/htkc_utils.dart';

class StepperChildren {
  /// title for the stepper
  final Widget? title;

  /// subtitle for the stepper
  final Widget? subtitle;

  final Widget? iconWidget;

  final Widget? topContent;

  final Widget? bottomContent;

  final GestureTapCallback? onTap;

  final EdgeInsetsGeometry? padding;

  final bool isEmergent;

  final Color color;

  final double? depth;

  final EmergentShape shape;

  final LightSource lightSource;

  final EmergentBorder border;

  /// Use the constructor of [StepperChildren] to pass the data needed.
  StepperChildren(
      {this.iconWidget,
      this.title, this.depth,
      this.subtitle,
      this.onTap,
      this.topContent = const SizedBox(),
      this.bottomContent = const SizedBox(),
      this.padding = const EdgeInsets.all(0),
      this.shape = EmergentShape.flat,
      this.lightSource = LightSource.topLeft,
      this.border = const EmergentBorder.none(),
      this.color = Colors.white,
      this.isEmergent = false});
}
