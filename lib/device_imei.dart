
import 'device_imei_platform_interface.dart';

class DeviceImei {
  Future<String?> getPlatformVersion() {
    return DeviceImeiPlatform.instance.getPlatformVersion();
  }
}
