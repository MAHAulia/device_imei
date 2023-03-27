import Flutter
import UIKit

public class SwiftDeviceImeiPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_imei", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceImeiPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getImei":
            result(UIDevice.current.identifierForVendor!.uuidString)
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        default:
            result(FlutterMethodNotImplemented)
        }
  }
}
