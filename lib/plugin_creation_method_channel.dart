import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_creation_platform_interface.dart';

/// An implementation of [PluginCreationPlatform] that uses method channels.
class MethodChannelPluginCreation extends PluginCreationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_creation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
