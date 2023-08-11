import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zoom_sdk_plugin/src/method_channel/zoom_sdk_plugin_platform_interface.dart';


/// An implementation of [ZoomSdkPluginPlatform] that uses method channels.
class MethodChannelZoomSdkPlugin extends ZoomSdkPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zoom_sdk_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
