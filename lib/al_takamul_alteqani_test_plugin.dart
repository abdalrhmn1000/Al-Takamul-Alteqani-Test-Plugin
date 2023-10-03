
import 'al_takamul_alteqani_test_plugin_platform_interface.dart';

class AlTakamulAlteqaniTestPlugin {
  Future<String?> getPlatformVersion() {
    return AlTakamulAlteqaniTestPluginPlatform.instance.getPlatformVersion();
  }

  Future<bool?> callAPI() {
    return AlTakamulAlteqaniTestPluginPlatform.instance.callAPI();
  }
}
