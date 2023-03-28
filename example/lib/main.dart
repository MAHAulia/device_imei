import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_imei/device_imei.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String? deviceImei;
  String? type;
  String message = "Please allow permission request!";
  DeviceInfo? deviceInfo;
  bool getPermission = false;
  bool isloading = false;
  final _deviceImeiPlugin = DeviceImei();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _setPlatformType();
    _getImei();
  }

  _setPlatformType() {
    if (Platform.isAndroid) {
      setState(() {
        type = 'Android';
      });
    } else if (Platform.isIOS) {
      setState(() {
        type = 'iOS';
      });
    } else {
      setState(() {
        type = 'other';
      });
    }
  }

  _getImei() async {
    var permission = await Permission.phone.status;

    DeviceInfo? dInfo = await _deviceImeiPlugin.getDeviceInfo();

    if (dInfo != null) {
      setState(() {
        deviceInfo = dInfo;
      });
    }

    if (permission.isGranted) {
      String? imei = await _deviceImeiPlugin.getDeviceImei();
      if (imei != null) {
        setState(() {
          getPermission = true;
          deviceImei = imei;
        });
      }
    } else {
      PermissionStatus status = await Permission.phone.request();
      if (status == PermissionStatus.granted) {
        setState(() {
          getPermission = false;
        });
        _getImei();
      } else {
        setState(() {
          getPermission = false;
          message = "Permission not granted, please allow permission";
        });
      }
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _deviceImeiPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion\n'),
              const Divider(),
              Text("ID : ${deviceInfo?.id}"),
              Text("SDK INT : ${deviceInfo?.sdkInt}"),
              Text("MODEL : ${deviceInfo?.model}"),
              Text("MANUFACTURE : ${deviceInfo?.manufacture}"),
              Text("DEVICE : ${deviceInfo?.device}"),
              const Divider(),
              isloading
                  ? const CircularProgressIndicator()
                  : getPermission
                      ? Text('Device $type: $deviceImei\n')
                      : Text(message),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _getImei,
                  child: const Text("Get Device Info"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
