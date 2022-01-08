# Device Imei

[ ![Build version](https://img.shields.io/badge/pub-v0.0.2-green)](https://pub.dev/packages/device_imei)

Flutter plugins to get real IMEI for Mobile Device

## Getting Started

Get IMEI (International Mobile Device Identity) for Android devices less than android 10 with runtime permission for android greater than or equal to 10 returns a UUID and get unique identification on ios An alphanumeric string that uniquely identifies a device for the application provider.

**Use**
```dart
import 'package:device_imei/device_imei.dart';

String imei = await DeviceImei.getImei();
```

### Platform Support

OS |
-- |
Android |
IOS |


License
----

MIT

### Author

This plugin is developed, **by Moh. Abdul Haq Aulia**