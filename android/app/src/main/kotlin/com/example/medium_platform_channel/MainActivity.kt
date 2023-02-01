package com.example.medium_platform_channel

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        PigeonAppDeviceHelper.AppDeviceHelper.setup(flutterEngine.dartExecutor.binaryMessenger, AppDeviceHelperPlugin(context))
    }
}
