// Import the web implementation if running on the web
import 'package:zoom_sdk_plugin/src/common/zoom_sdk_plugin_interface.dart';
import 'package:zoom_sdk_plugin/src/web/zoom_sdk_plugin_web.dart' if (dart.library.io) 'package:zoom_sdk_plugin/src/method_channel/zoom_sdk_plugin_platform_interface.dart';

class ZoomSdkPlugin implements ZoomSdkPluginInterface {
  // Delegate the implementation to the imported class
  final ZoomSdkPluginInterface _platformInterface = ZoomSdkPluginWeb();

  @override
  Future<void> init(String sdkKey, String sdkSecret, String meetingNumber, String userName, int role, String passWord) {
    return _platformInterface.init(sdkKey, sdkSecret, meetingNumber, userName, role, passWord);
  }

  @override
  Future<void> joinMeeting(String meetingNumber, String password, String userName, String userEmail) {
    return _platformInterface.joinMeeting(meetingNumber, password, userName, userEmail);
  }

  @override
  Future<void> startMeeting(String meetingNumber, String password, String userName, String userEmail) {
    return _platformInterface.startMeeting(meetingNumber, password, userName, userEmail);
  }
}
