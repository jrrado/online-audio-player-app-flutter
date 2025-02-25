import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Initialize notifications
  Future<void> initializeNotifications() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notification received: ${message.notification?.title}");
    });
  }

  // Send notification
  Future<void> sendNotification(String title, String body) async {
    // Use Firebase Cloud Functions or a backend service to send notifications
  }
}