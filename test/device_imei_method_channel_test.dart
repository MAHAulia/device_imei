import 'package:device_imei/device_imei.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_imei/device_imei_method_channel.dart';

void main() {
  MethodChannelDeviceImei platform = MethodChannelDeviceImei();
  const MethodChannel channel = MethodChannel('device_imei');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == "getPlatformVersion") {
        return '41';
      } else if (methodCall.method == "getDeviceImei") {
        return '353749090441001';
      } else if (methodCall.method == "getDeviceInfo") {
        return DeviceInfo(
            deviceId: "PPR1.180610.100",
            sdkInt: "28",
            model: "ASUS_X017DZ",
            manufacture: "asus",
            device: "ASUS_X017D_1");
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('Test getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('Test getDeviceImei', () async {
    expect(await platform.getDeviceImei(), '353749090441001');
  });

  test('Test getDeviceInfo', () async {
    expect(
      await platform.getDeviceInfo(),
      DeviceInfo(
          deviceId: "PPR1.180610.100",
          sdkInt: "28",
          model: "ASUS_X017DZ",
          manufacture: "asus",
          device: "ASUS_X017D_1"),
    );
  });
}
