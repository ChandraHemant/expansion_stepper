import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'expansion_stepper_method_channel.dart';

abstract class ExpansionStepperPlatform extends PlatformInterface {
  /// Constructs a ExpansionStepperPlatform.
  ExpansionStepperPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExpansionStepperPlatform _instance = MethodChannelExpansionStepper();

  /// The default instance of [ExpansionStepperPlatform] to use.
  ///
  /// Defaults to [MethodChannelExpansionStepper].
  static ExpansionStepperPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExpansionStepperPlatform] when
  /// they register themselves.
  static set instance(ExpansionStepperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
