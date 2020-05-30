package com.example.pd_carnet_native

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;

class Application : FlutterApplication(), PluginRegistrantCallback {
  override fun onCreate() {
    super.onCreate()
    FlutterFirebaseMessagingService.setPluginRegistrant(this)
  }

  override fun registerWith(registry: PluginRegistry?) {
    // https://github.com/FirebaseExtended/flutterfire/issues/1613
//    GeneratedPluginRegistrant.registerWith(registry)
    registry?.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin");
  }
}