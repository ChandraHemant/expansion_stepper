import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'expansion_stepper_platform_interface.dart';

/// An implementation of [ExpansionStepperPlatform] that uses method channels.
class MethodChannelExpansionStepper extends ExpansionStepperPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('expansion_stepper');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
