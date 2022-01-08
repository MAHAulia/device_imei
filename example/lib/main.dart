import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_imei/device_imei.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _deviceImei = 'Unknown';

  @override
  void initState() {
    super.initState();
    getImei();
  }

  Future<void> getImei() async {
    String? imei;
    try {
      imei = await DeviceImei.getImei();
    } catch (e) {
      print(e);
    }

    if (!mounted) return;
    setState(() {
      _deviceImei = imei;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('IMEI: $_deviceImei\n'),
            ],
          ),
        ),
      ),
    );
  }
}
