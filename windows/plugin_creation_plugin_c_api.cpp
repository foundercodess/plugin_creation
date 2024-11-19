#include "include/plugin_creation/plugin_creation_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "plugin_creation_plugin.h"

void PluginCreationPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  plugin_creation::PluginCreationPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
