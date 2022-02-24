import 'dart:async';

import 'package:flutter/services.dart';

enum SmsStatus { sent, failed }

class BackgroundSms {
  static const MethodChannel _channel = const MethodChannel('background_sms');

  static Future<SmsStatus> sendMessage(
      {required String phoneNumber,
      required String message,
      int? simSlot}) async {
    try {
      String? result = await _channel.invokeMethod('sendSms', <String, dynamic>{
        "phone": phoneNumber,
        "msg": message,
        "simSlot": simSlot
      });
      return result == "Sent" ? SmsStatus.sent : SmsStatus.failed;
    } on PlatformException catch (e) {
      print(e.toString());
      return SmsStatus.failed;
    }
  }

  static Future<bool?> get isSupportCustomSim async {
    try {
      return await _channel.invokeMethod('isSupportMultiSim');
    } on PlatformException catch (e) {
      print(e.toString());
      return true;
    }
  }
}
