import 'package:flutter_test/flutter_test.dart';
import 'package:zoom_sdk_plugin/src/common/zoom_sdk_plugin_interface.dart';
import 'package:zoom_sdk_plugin/zoom_sdk_plugin.dart';

class MockZoomSdkPluginPlatform implements ZoomSdkPluginInterface {
  @override
  Future<void> init(String sdkKey, String authEndpoint) async {}

  @override
  Future<void> joinMeeting(String meetingNumber, String password, String userName, String userEmail) async {}

  @override
  Future<void> startMeeting(String meetingNumber, String password, String userName, String userEmail) async {}
}

void main() {
  ZoomSdkPlugin zoomSdkPlugin = ZoomSdkPlugin();
  MockZoomSdkPluginPlatform mockPlatform = MockZoomSdkPluginPlatform();

  // Replace the platform-specific implementation with the mock
  zoomSdkPlugin._platformInterface = mockPlatform;

  test('init method', () async {
    await zoomSdkPlugin.init('sdkKey', 'authEndpoint');
    // Add assertions or verifications as needed
  });

  test('joinMeeting method', () async {
    await zoomSdkPlugin.joinMeeting('meetingNumber', 'password', 'userName', 'userEmail');
    // Add assertions or verifications as needed
  });

  test('startMeeting method', () async {
    await zoomSdkPlugin.startMeeting('meetingNumber', 'password', 'userName', 'userEmail');
    // Add assertions or verifications as needed
  });
}
