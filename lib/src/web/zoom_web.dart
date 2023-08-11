@JS()
library zoom_web;

import 'package:js/js.dart';

@JS('initZoom')
external void initZoom(String sdkKey, String sdkSecret, String meetingNumber, int role);

@JS('joinMeeting')
external void joinMeeting(String meetingNumber, String passWord, String userName, String userEmail);

@JS('startMeeting')
external void startMeeting(String meetingNumber, String passWord, String userName, String userEmail);
