import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_creation_method_channel.dart';

abstract class PluginCreationPlatform extends PlatformInterface {
  /// Constructs a PluginCreationPlatform.
  PluginCreationPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginCreationPlatform _instance = MethodChannelPluginCreation();

  /// The default instance of [PluginCreationPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginCreation].
  static PluginCreationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginCreationPlatform] when
  /// they register themselves.
  static set instance(PluginCreationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
