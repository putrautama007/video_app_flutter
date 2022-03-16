import 'package:flutter/services.dart';

abstract class FlutterMethodChannel {
  Future<String> getPlaylistId();
}

class FlutterMethodChannelImpl implements FlutterMethodChannel {
  static const channelName = "example.flutter/VideoApp";
  static const getPlaylistIdData = "getPlaylistId";
  final MethodChannel methodChannel = const MethodChannel(channelName);

  @override
  Future<String> getPlaylistId() async {
    try {
      final String result = await methodChannel.invokeMethod(getPlaylistIdData);
      return result;
    } catch (_) {
      return "UUbc1RY0McnikiEMD8Box5Ig";
    }
  }
}