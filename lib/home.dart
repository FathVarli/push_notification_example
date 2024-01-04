import 'package:flutter/material.dart';
import 'package:push_notification_example/service.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final _service = FirebaseNotificationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.connectNotification();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notification Example"),
      ),
    );
  }
}