package com.example.flutter_2gis

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger

/** Flutter2gisPlugin */
class Flutter2gisPlugin: FlutterPlugin {

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val messenger: BinaryMessenger = flutterPluginBinding.binaryMessenger;
    flutterPluginBinding
      .platformViewRegistry
      .registerViewFactory("<dgis-view-flutter>", NativeViewFactory(messenger))
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
  }
}
