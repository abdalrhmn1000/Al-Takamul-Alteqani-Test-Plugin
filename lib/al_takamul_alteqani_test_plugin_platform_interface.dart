import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'al_takamul_alteqani_test_plugin_method_channel.dart';

abstract class AlTakamulAlteqaniTestPluginPlatform extends PlatformInterface {
  AlTakamulAlteqaniTestPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlTakamulAlteqaniTestPluginPlatform _instance =
      MethodChannelAlTakamulAlteqaniTestPlugin();

  static AlTakamulAlteqaniTestPluginPlatform get instance => _instance;

  static set instance(AlTakamulAlteqaniTestPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> callAPI() {
    throw UnimplementedError('callAPI() has not been implemented.');
  }
}
