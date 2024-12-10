//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <expansion_stepper/expansion_stepper_plugin.h>
#include <itq_utils/itq_utils_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) expansion_stepper_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ExpansionStepperPlugin");
  expansion_stepper_plugin_register_with_registrar(expansion_stepper_registrar);
  g_autoptr(FlPluginRegistrar) itq_utils_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "itq_utils_plugin");
  itq_utils_plugin_register_with_registrar(itq_utils_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
