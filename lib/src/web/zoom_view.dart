import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/widgets.dart';

class ZoomView extends StatelessWidget {
  final String meetingId;
  final String signature;

  const ZoomView({super.key, required this.meetingId, required this.signature});

  @override
  Widget build(BuildContext context) {
    // Create a div element
    final zoomDiv = html.DivElement()
      ..id = 'zmmtg-root' // Make sure the ID matches the one used in your JavaScript code
      ..style.width = '100%'
      ..style.height = '100%';

    // Append the div element to the Flutter web view
    html.querySelector('flt-platform-view')!.append(zoomDiv);

    // Call the JavaScript function to initialize the Zoom meeting
    js.context.callMethod('initZoom', [meetingId, signature]);

    return Container();
  }
}
