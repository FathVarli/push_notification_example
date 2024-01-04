import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingsNotification() async {
    await messaging.requestPermission(alert: true, sound: true, badge: true);
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
        alert: true, sound: true, badge: true);



    settingsNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
        title: "${event.notification?.title}",
        description: "${event.notification?.body}",
        leading: event.notification?.android?.imageUrl == null
            ? null
            : Image.network(
                "${event.notification?.android?.imageUrl}",
                width: 40,
                height: 40,
              ),
        position: SnackbarPosition.top,
      );
    });

    messaging.getToken().then((value) => log("Token: $value",
        name: "FCM Token")); // backende tokeni post ile gonderirsin.
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
