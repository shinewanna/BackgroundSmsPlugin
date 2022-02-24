# Background SMS

This is an SMS library for flutter.
You can send SMS from foreground, background, and headless.

It only support Android for now.

## Installation and Usage

Add `background_sms` to the dependencies list
of the `pubspec.yaml` file as follow:

```yaml
dependencies:
  flutter:
    sdk: flutter

  background_sms: ^0.0.1
```

Then run the command `flutter packages get` on the console.



First add permission to send sms in AndroidManifest.xml.

```xml
<uses-permission android:name="android.permission.SEND_SMS" />
```

Then request permission for send sms.Use [Permission Handler](https://pub.dev/packages/permission_handler) or something other.

Import

```dart
import 'package:background_sms/background_sms.dart';
```

Simply send sms with default sim.

```dart
  String result = await BackgroundSms.sendMessage(
     phoneNumber: "09xxxxxxxxx", message: "Message");
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
```

Send with custom sim slot 1 for sim1, 2 for sim2 and so on.

```dart
  String result = await BackgroundSms.sendMessage(
     phoneNumber: "09xxxxxxxxx", message: "Message", simSlot: 1);
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
```

You can check Custom Sim Slot is support from Native Android.

```dart
  bool result = await BackgroundSms.isSupportCustomSim;
    if (result) {
      print("Support Custom Sim Slot");
        String result = await BackgroundSms.sendMessage(
        phoneNumber: "09xxxxxxxxx", message: "Message", simSlot: 1);
        if (result == SmsStatus.sent) {
          print("Sent");
        } else {
          print("Failed");
        }
    } else {
      print("Not Support Custom Sim Slot");
        String result = await BackgroundSms.sendMessage(
        phoneNumber: "09xxxxxxxxx", message: "Message");
        if (result == SmsStatus.sent) {
          print("Sent");
        } else {
          print("Failed");
        }
    }
```

## Platform Detail
Flutter 2.8.1 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 77d935af4d (2 months ago) • 2021-12-16 08:37:33 -0800
Engine • revision 890a5fca2e
Tools • Dart 2.15.1

### Created by
[Shine Wanna](https://github.com/shinewanna)
