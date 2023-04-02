import Flutter
import UIKit

public class DeviceImeiPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_imei", binaryMessenger: registrar.messenger())
    let instance = DeviceImeiPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    print(call.method)
    if (call.method == "getPlatformVersion") {
      result("iOS " + UIDevice.current.systemVersion)
    } else if (call.method == "getDeviceImei") {
      result("182318237162398612")
    } else if (call.method == "getDeviceInfo") {
      let deviceInfo: [Any] = [
        "sdk_int": "1",
        "model": "model",
        "manufacture": "1manufacture",
        "device": "1device",
        "di": "1129387",
      ]
      let info = JSONSerialization.isValidJSONObject(jsonObject) //
      result(info.toString())
    }
    
  }
}
