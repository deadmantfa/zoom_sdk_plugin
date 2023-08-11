import 'dart:convert';
import 'dart:html';
import 'dart:js' as js;
import 'package:jose/jose.dart';
import 'package:zoom_sdk_plugin/src/web/zoom_web.dart';
import 'package:zoom_sdk_plugin/src/common/zoom_sdk_plugin_interface.dart';

class ZoomSdkPluginWeb implements ZoomSdkPluginInterface {
  ZoomSdkPluginWeb() {
    final script = ScriptElement()
      ..src = 'packages/zoom_sdk_plugin/src/web/zoom_web.js';
    document.head!.append(script);
    exposeGenerateSignatureToJs();
  }

  @override
  Future<void> init(String sdkKey, String sdkSecret, String meetingNumber, String userName, int role, String passWord) async {
    initZoomMeeting(sdkKey, sdkSecret, meetingNumber, userName, role, passWord);
  }

  @override
  Future<void> joinMeeting(String meetingNumber, String password, String userName, String userEmail) async {
    joinMeeting(meetingNumber, password, userName, userEmail);
  }

  @override
  Future<void> startMeeting(String meetingNumber, String password, String userName, String userEmail) async {
    startMeeting(meetingNumber, password, userName, userEmail);
  }

  String _generateSignature(String key, String secret, String meetingNumber, int role) {
    final int iat = (DateTime.now().millisecondsSinceEpoch / 1000).floor() - 30;
    final int exp = iat + 60 * 60 * 2;

    final claims = JsonWebTokenClaims.fromJson({
      'sdkKey': key,
      'appKey': key,
      'mn': meetingNumber,
      'role': role,
      'iat': iat,
      'exp': exp,
      'tokenExp': exp,
    });

    final builder = JsonWebSignatureBuilder()
      ..jsonContent = jsonEncode(claims.toJson())
      ..setProtectedHeader('alg', 'HS256')
      ..setProtectedHeader('typ', 'JWT')
      ..addRecipient(JsonWebKey.fromJson({'kty': 'oct', 'k': secret}), algorithm: 'HS256');

    final signature = builder.build().toCompactSerialization();
    return signature;
  }

  void exposeGenerateSignatureToJs() {
    js.context['generateSignature'] = (String sdkKey, String sdkSecret, String meetingNumber, int role) {
      return _generateSignature(sdkKey, sdkSecret, meetingNumber, role);
    };
  }

  void initZoomMeeting(String sdkKey, String sdkSecret, String meetingNumber, String userName, int role, String passWord) {
    // Call the JavaScript function to initialize the Zoom meeting
    js.context.callMethod('initZoom', [sdkKey, sdkSecret, meetingNumber, userName, role, passWord]);
  }
}
