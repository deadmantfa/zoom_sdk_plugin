import 'package:flutter/material.dart';
import 'package:zoom_sdk_plugin/zoom_sdk_plugin.dart';
import 'zoom_keys.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ZoomSdkPlugin zoomSdkPlugin = ZoomSdkPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zoom SDK Plugin Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  zoomSdkPlugin.init(sdkKey, sdkSecret, zoomMeetId, zoomUsername, 0, zoomPassword);
                },
                child: const Text('Initialize Zoom'),
              ),
              ElevatedButton(
                onPressed: () {
                  zoomSdkPlugin.joinMeeting(zoomMeetId, zoomPassword, zoomUsername, zoomEmail);
                },
                child: const Text('Join Meeting'),
              ),
              ElevatedButton(
                onPressed: () {
                  zoomSdkPlugin.startMeeting(zoomMeetId, zoomPassword, zoomUsername, zoomEmail);
                },
                child: const Text('Start Meeting'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
