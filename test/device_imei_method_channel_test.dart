import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_imei/device_imei_method_channel.dart';

void main() {
  MethodChannelDeviceImei platform = MethodChannelDeviceImei();
  const MethodChannel channel = MethodChannel('device_imei');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
