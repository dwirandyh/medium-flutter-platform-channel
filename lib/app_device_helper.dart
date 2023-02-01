// Autogenerated from Pigeon (v7.1.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class AppInfo {
  AppInfo({
    required this.appID,
    required this.appVersion,
  });

  String appID;

  String appVersion;

  Object encode() {
    return <Object?>[
      appID,
      appVersion,
    ];
  }

  static AppInfo decode(Object result) {
    result as List<Object?>;
    return AppInfo(
      appID: result[0]! as String,
      appVersion: result[1]! as String,
    );
  }
}

class DeviceInfo {
  DeviceInfo({
    required this.deviceName,
    required this.osVersion,
  });

  String deviceName;

  String osVersion;

  Object encode() {
    return <Object?>[
      deviceName,
      osVersion,
    ];
  }

  static DeviceInfo decode(Object result) {
    result as List<Object?>;
    return DeviceInfo(
      deviceName: result[0]! as String,
      osVersion: result[1]! as String,
    );
  }
}

class _AppDeviceHelperCodec extends StandardMessageCodec {
  const _AppDeviceHelperCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AppInfo) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is DeviceInfo) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return AppInfo.decode(readValue(buffer)!);
      case 129: 
        return DeviceInfo.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class AppDeviceHelper {
  /// Constructor for [AppDeviceHelper].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AppDeviceHelper({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _AppDeviceHelperCodec();

  Future<AppInfo> getAppInfo() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AppDeviceHelper.getAppInfo', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as AppInfo?)!;
    }
  }

  Future<DeviceInfo> getDeviceInfo() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AppDeviceHelper.getDeviceInfo', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as DeviceInfo?)!;
    }
  }

  Future<int> getBatteryLevel() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AppDeviceHelper.getBatteryLevel', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as int?)!;
    }
  }
}
