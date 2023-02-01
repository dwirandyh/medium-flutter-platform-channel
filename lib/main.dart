import 'package:flutter/material.dart';
import 'package:medium_platform_channel/app_device_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppInfo appInfo = AppInfo(appID: "", appVersion: "");
  DeviceInfo deviceInfo = DeviceInfo(deviceName: "", osVersion: "");
  int batteryLevel = 0;
  AppDeviceHelper deviceHelper = AppDeviceHelper();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final appInfoRetrieved = await deviceHelper.getAppInfo();
    final deviceInfoRetrieved = await deviceHelper.getDeviceInfo();
    final batteryLevelRetrieved = await deviceHelper.getBatteryLevel();

    setState(() {
      appInfo = appInfoRetrieved;
      deviceInfo = deviceInfoRetrieved;
      batteryLevel = batteryLevelRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Platform Channel")),
        body: Center(
          child: Column(
            children: [
              const Text(
                "Platform Channel Example",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              const Text(
                "Application Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text("App ID: ${appInfo.appID}"),
              Text("App Version: ${appInfo.appVersion}"),
              const SizedBox(height: 8),
              const Text(
                "Device Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text("Device Name: ${deviceInfo.deviceName}"),
              Text("OS Version: ${deviceInfo.osVersion}"),
              Text("Battery Level: ${batteryLevel}%"),
            ],
          ),
        ),
      ),
    );
  }
}
