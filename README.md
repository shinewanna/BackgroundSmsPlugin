# Background SMS

This is an SMS library for flutter.
You can send SMS from foreground, background, and headless.

It only support Android for now.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

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
}
```



### Created by
[Shine Wanna](https://github.com/shinewanna)

## Contributions

Any contribution is welcome.