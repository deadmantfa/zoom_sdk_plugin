import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:zoom_sdk_plugin/src/method_channel/zoom_sdk_plugin_method_channel.dart';

abstract class ZoomSdkPluginPlatform extends PlatformInterface {
  /// Constructs a ZoomSdkPluginPlatform.
  ZoomSdkPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZoomSdkPluginPlatform _instance = MethodChannelZoomSdkPlugin();

  /// The default instance of [ZoomSdkPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelZoomSdkPlugin].
  static ZoomSdkPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZoomSdkPluginPlatform] when
  /// they register themselves.
  static set instance(ZoomSdkPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
