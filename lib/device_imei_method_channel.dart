import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_imei_platform_interface.dart';

/// An implementation of [DeviceImeiPlatform] that uses method channels.
class MethodChannelDeviceImei extends DeviceImeiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_imei');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
