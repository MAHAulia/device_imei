#import "DeviceImeiPlugin.h"
#if __has_include(<device_imei/device_imei-Swift.h>)
#import <device_imei/device_imei-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_imei-Swift.h"
#endif

@implementation DeviceImeiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceImeiPlugin registerWithRegistrar:registrar];
}
@end
