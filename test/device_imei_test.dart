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

  @override
  Future<String?> getDeviceImei() => Future.value("353749090441001");

  @override
  Future<DeviceInfo?> getDeviceInfo() => Future.value(DeviceInfo(
      id: "PPR1.180610.100",
      sdkInt: 28,
      model: "ASUS_X017DZ",
      manufacture: "asus",
      device: "ASUS_X017D_1"));
}

void main() {
  final DeviceImeiPlatform initialPlatform = DeviceImeiPlatform.instance;

  test('$MethodChannelDeviceImei is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceImei>());
  });

  test('Test Funtional Method', () async {
    DeviceImei deviceImeiPlugin = DeviceImei();
    MockDeviceImeiPlatform fakePlatform = MockDeviceImeiPlatform();
    DeviceImeiPlatform.instance = fakePlatform;

    expect(await deviceImeiPlugin.getPlatformVersion(), '42');
    expect(await deviceImeiPlugin.getDeviceImei(), '353749090441001');
    expect(
        await deviceImeiPlugin.getDeviceInfo(),
        DeviceInfo(
            id: "PPR1.180610.100",
            sdkInt: 28,
            model: "ASUS_X017DZ",
            manufacture: "asus",
            device: "ASUS_X017D_1"));
  });
}
