import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let deviceImei = FlutterMethodChannel(name: "device_imei",
                                                binaryMessenger: controller.binaryMessenger)
      deviceImei.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          guard call.method == "getImei" else {
              result(FlutterMethodNotImplemented)
              return
            }
            self.getImei(result: result)
            
      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getImei(result: FlutterResult) {
      result(UIDevice.current.identifierForVendor!.uuidString)
    }

    private func getPlatformVersion(result: FlutterResult) {
      result("0.0.1")
    }
}
