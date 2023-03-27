import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_imei_method_channel.dart';

abstract class DeviceImeiPlatform extends PlatformInterface {
  /// Constructs a DeviceImeiPlatform.
  DeviceImeiPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceImeiPlatform _instance = MethodChannelDeviceImei();

  /// The default instance of [DeviceImeiPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceImei].
  static DeviceImeiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceImeiPlatform] when
  /// they register themselves.
  static set instance(DeviceImeiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
