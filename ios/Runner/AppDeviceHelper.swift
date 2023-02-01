// Autogenerated from Pigeon (v7.1.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

/// Generated class from Pigeon that represents data sent in messages.
struct AppInfo {
  var appID: String
  var appVersion: String

  static func fromList(_ list: [Any?]) -> AppInfo? {
    let appID = list[0] as! String
    let appVersion = list[1] as! String

    return AppInfo(
      appID: appID,
      appVersion: appVersion
    )
  }
  func toList() -> [Any?] {
    return [
      appID,
      appVersion,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct DeviceInfo {
  var deviceName: String
  var osVersion: String

  static func fromList(_ list: [Any?]) -> DeviceInfo? {
    let deviceName = list[0] as! String
    let osVersion = list[1] as! String

    return DeviceInfo(
      deviceName: deviceName,
      osVersion: osVersion
    )
  }
  func toList() -> [Any?] {
    return [
      deviceName,
      osVersion,
    ]
  }
}
private class AppDeviceHelperCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return AppInfo.fromList(self.readValue() as! [Any])
      case 129:
        return DeviceInfo.fromList(self.readValue() as! [Any])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class AppDeviceHelperCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? AppInfo {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? DeviceInfo {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class AppDeviceHelperCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return AppDeviceHelperCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return AppDeviceHelperCodecWriter(data: data)
  }
}

class AppDeviceHelperCodec: FlutterStandardMessageCodec {
  static let shared = AppDeviceHelperCodec(readerWriter: AppDeviceHelperCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol AppDeviceHelper {
  func getAppInfo() throws -> AppInfo
  func getDeviceInfo() throws -> DeviceInfo
  func getBatteryLevel() throws -> Int32
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class AppDeviceHelperSetup {
  /// The codec used by AppDeviceHelper.
  static var codec: FlutterStandardMessageCodec { AppDeviceHelperCodec.shared }
  /// Sets up an instance of `AppDeviceHelper` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: AppDeviceHelper?) {
    let getAppInfoChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppDeviceHelper.getAppInfo", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getAppInfoChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getAppInfo()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getAppInfoChannel.setMessageHandler(nil)
    }
    let getDeviceInfoChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppDeviceHelper.getDeviceInfo", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getDeviceInfoChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getDeviceInfo()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getDeviceInfoChannel.setMessageHandler(nil)
    }
    let getBatteryLevelChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppDeviceHelper.getBatteryLevel", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getBatteryLevelChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getBatteryLevel()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getBatteryLevelChannel.setMessageHandler(nil)
    }
  }
}
