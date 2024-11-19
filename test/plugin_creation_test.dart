import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_creation/plugin_creation.dart';
import 'package:plugin_creation/plugin_creation_platform_interface.dart';
import 'package:plugin_creation/plugin_creation_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginCreationPlatform
    with MockPlatformInterfaceMixin
    implements PluginCreationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginCreationPlatform initialPlatform = PluginCreationPlatform.instance;

  test('$MethodChannelPluginCreation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginCreation>());
  });

  test('getPlatformVersion', () async {
    PluginCreation pluginCreationPlugin = PluginCreation();
    MockPluginCreationPlatform fakePlatform = MockPluginCreationPlatform();
    PluginCreationPlatform.instance = fakePlatform;

    expect(await pluginCreationPlugin.getPlatformVersion(), '42');
  });
}
