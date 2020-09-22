import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _getPermission() async => await [
        Permission.sms,
      ].request();

  Future<bool> _isPermissionGranted() async => await Permission.sms.status.isGranted;

  _sendMessage(String phoneNumber, String message, {String simSlot}) async {
    var result = await BackgroundSms.sendMessage(
        phoneNumber: "09xxxxxxxxxx", message: "Hello");
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Send Sms'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () async {
            if (await _isPermissionGranted()) _sendMessage("09xxxxxxxxxx", "Hello");
            _getPermission();
          },
        ),
      ),
    );
  }
}
