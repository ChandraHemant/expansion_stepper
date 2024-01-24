#include "include/expansion_stepper/expansion_stepper_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "expansion_stepper_plugin.h"

void ExpansionStepperPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  expansion_stepper::ExpansionStepperPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
