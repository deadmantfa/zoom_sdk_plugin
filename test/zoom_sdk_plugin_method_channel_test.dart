import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoom_sdk_plugin/src/method_channel/zoom_sdk_plugin_method_channel.dart';

void main() {
  MethodChannelZoomSdkPlugin platform = MethodChannelZoomSdkPlugin();
  const MethodChannel channel = MethodChannel('zoom_sdk_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
