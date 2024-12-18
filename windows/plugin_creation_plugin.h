#ifndef FLUTTER_PLUGIN_PLUGIN_CREATION_PLUGIN_H_
#define FLUTTER_PLUGIN_PLUGIN_CREATION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace plugin_creation {

class PluginCreationPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PluginCreationPlugin();

  virtual ~PluginCreationPlugin();

  // Disallow copy and assign.
  PluginCreationPlugin(const PluginCreationPlugin&) = delete;
  PluginCreationPlugin& operator=(const PluginCreationPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace plugin_creation

#endif  // FLUTTER_PLUGIN_PLUGIN_CREATION_PLUGIN_H_
