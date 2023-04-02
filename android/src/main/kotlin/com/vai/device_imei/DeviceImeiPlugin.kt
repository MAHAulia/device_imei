package com.vai.device_imei

import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.telephony.TelephonyManager
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject
import java.util.jar.Manifest


/** DeviceImeiPlugin */
class DeviceImeiPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var appContext: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_imei")
    channel.setMethodCallHandler(this)
    appContext = flutterPluginBinding.applicationContext;
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getDeviceImei") {
      result.success(getImei());
    }else if(call.method.equals("getDeviceInfo")){
      result.success(getDeviceInfo().toString());
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getDeviceInfo() : JSONObject {
    var deviceInfo = JSONObject();
    deviceInfo.put("sdk_int", Build.VERSION.SDK_INT)
    deviceInfo.put("model", Build.MODEL)
    deviceInfo.put("manufacture", Build.MANUFACTURER)
    deviceInfo.put("device", Build.DEVICE)
    deviceInfo.put("device_id", getImei())
    return deviceInfo
  }

  private fun getImei () : String {
    var imeiNumber: String? = ""

    val telephonyManager: TelephonyManager =
      appContext.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
    if (Build.VERSION.SDK_INT > Build.VERSION_CODES.P) {
      imeiNumber = telephonyManager.deviceId
    } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      if (telephonyManager?.imei != null) {
        imeiNumber = telephonyManager.imei
      }
    } else {
      if (telephonyManager?.deviceId != null) {
        imeiNumber = telephonyManager.deviceId
      }
    }
    return imeiNumber!!
  }
}
