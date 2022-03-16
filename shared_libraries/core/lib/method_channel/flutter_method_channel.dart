import 'package:flutter/services.dart';

abstract class FlutterMethodChannel {
  Future<String> searchVideo();
}

class FlutterMethodChannelImpl implements FlutterMethodChannel {
  static const channelName = "example.flutter/VideoApp";
  static const searchQuery = "search";
  final MethodChannel methodChannel = const MethodChannel(channelName);

  @override
  Future<String> searchVideo() async {
    try {
      final String result = await methodChannel.invokeMethod(searchQuery);
      return result;
    } catch (_) {
      return "ruangguru";
    }
  }
}