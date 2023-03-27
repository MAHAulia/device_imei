import 'package:flutter_test/flutter_test.dart';
import 'package:device_imei/device_imei.dart';
import 'package:device_imei/device_imei_platform_interface.dart';
import 'package:device_imei/device_imei_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceImeiPlatform
    with MockPlatformInterfaceMixin
    implements DeviceImeiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DeviceImeiPlatform initialPlatform = DeviceImeiPlatform.instance;

  test('$MethodChannelDeviceImei is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceImei>());
  });

  test('getPlatformVersion', () async {
    DeviceImei deviceImeiPlugin = DeviceImei();
    MockDeviceImeiPlatform fakePlatform = MockDeviceImeiPlatform();
    DeviceImeiPlatform.instance = fakePlatform;

    expect(await deviceImeiPlugin.getPlatformVersion(), '42');
  });
}
