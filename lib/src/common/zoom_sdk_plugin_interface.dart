abstract class ZoomSdkPluginInterface {
  Future<void> init(String sdkKey, String sdkSecret, String meetingNumber, String userName, int role, String passWord);
  Future<void> joinMeeting(String meetingNumber, String password, String userName, String userEmail);
  Future<void> startMeeting(String meetingNumber, String password, String userName, String userEmail);
// Add other methods you need here
}
