//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <desktop_drop/desktop_drop_plugin.h>
#include <starflut/starflut_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  DesktopDropPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopDropPlugin"));
  StarflutPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("StarflutPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
