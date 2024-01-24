#ifndef FLUTTER_PLUGIN_EXPANSION_STEPPER_PLUGIN_H_
#define FLUTTER_PLUGIN_EXPANSION_STEPPER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace expansion_stepper {

class ExpansionStepperPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ExpansionStepperPlugin();

  virtual ~ExpansionStepperPlugin();

  // Disallow copy and assign.
  ExpansionStepperPlugin(const ExpansionStepperPlugin&) = delete;
  ExpansionStepperPlugin& operator=(const ExpansionStepperPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace expansion_stepper

#endif  // FLUTTER_PLUGIN_EXPANSION_STEPPER_PLUGIN_H_
