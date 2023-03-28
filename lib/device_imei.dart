import 'dart:convert';

import 'device_imei_platform_interface.dart';

class DeviceImei {
  Future<String?> getPlatformVersion() {
    return DeviceImeiPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDeviceImei() {
    return DeviceImeiPlatform.instance.getDeviceImei();
  }

  Future<DeviceInfo?> getDeviceInfo() {
    return DeviceImeiPlatform.instance.getDeviceInfo();
  }
}

class DeviceInfo {
  String? id;
  int? sdkInt;
  String? model;
  String? manufacture;
  String? device;
  DeviceInfo({
    this.id,
    this.sdkInt,
    this.model,
    this.manufacture,
    this.device,
  });

  DeviceInfo copyWith({
    String? id,
    int? sdkInt,
    String? model,
    String? manufacture,
    String? device,
  }) {
    return DeviceInfo(
      id: id ?? this.id,
      sdkInt: sdkInt ?? this.sdkInt,
      model: model ?? this.model,
      manufacture: manufacture ?? this.manufacture,
      device: device ?? this.device,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sdkInt': sdkInt,
      'model': model,
      'manufacture': manufacture,
      'device': device,
    };
  }

  factory DeviceInfo.fromMap(Map<String, dynamic> map) {
    return DeviceInfo(
      id: map['id'],
      sdkInt: map['sdk_int']?.toInt(),
      model: map['model'],
      manufacture: map['manufacture'],
      device: map['device'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfo.fromJson(String source) =>
      DeviceInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeviceInfo(id: $id, sdkInt: $sdkInt, model: $model, manufacture: $manufacture, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeviceInfo &&
        other.id == id &&
        other.sdkInt == sdkInt &&
        other.model == model &&
        other.manufacture == manufacture &&
        other.device == device;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sdkInt.hashCode ^
        model.hashCode ^
        manufacture.hashCode ^
        device.hashCode;
  }
}
