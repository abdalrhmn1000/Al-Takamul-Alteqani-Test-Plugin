import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'al_takamul_alteqani_test_plugin_platform_interface.dart';

class MethodChannelAlTakamulAlteqaniTestPlugin
    extends AlTakamulAlteqaniTestPluginPlatform {

  @visibleForTesting
  final methodChannel = const MethodChannel('al_takamul_alteqani_test_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> callAPI() async {
    final hasResult = await methodChannel.invokeMethod<bool>('callAPI');
    return hasResult;
  }
}
