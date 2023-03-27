
import 'dart:async';

import 'package:flutter/services.dart';

class DeviceImei {
  static const MethodChannel _channel = MethodChannel('device_imei');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get getImei async {
    late String imei;
    imei = await _channel.invokeMethod('getImei');
    if (imei == "") {
      await Future.delayed(const Duration(seconds: 1));
      imei = await _channel.invokeMethod('getImei');
    }
    return await _channel.invokeMethod('getImei');
  }
}
