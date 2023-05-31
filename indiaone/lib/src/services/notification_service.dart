import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('logo');

  void initializeNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);
    await _flutterNotificationPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(title, body,
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterNotificationPlugin.show(
        0, 'test', 'testing notification', notificationDetails);
  }

  void scheduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channelId', "'channelName",importance: Importance.high,priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterNotificationPlugin.periodicallyShow(0, title, body, RepeatInterval.everyMinute, notificationDetails);
  }
}
