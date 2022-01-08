// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';

import 'package:flutter/services.dart';

class DeviceImei {
  static const MethodChannel _channel = MethodChannel('device_imei');

  static Future<String?> getImei() async {
    late String imei;
    imei = await _channel.invokeMethod('getImei');
    if (imei == "") {
      await Future.delayed(const Duration(seconds: 1));
      imei = await _channel.invokeMethod('getImei');
    }
    return await _channel.invokeMethod('getImei');
  }
}
