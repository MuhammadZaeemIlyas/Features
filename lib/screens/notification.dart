import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recordin_app/services/notification_service.dart';

class NotificationScreeen extends StatefulWidget {
  const NotificationScreeen({super.key});

  @override
  State<NotificationScreeen> createState() => _NotificationScreeenState();
}

class _NotificationScreeenState extends State<NotificationScreeen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    notificationServices.initialiseNotifications();
    // TODO: implement initState
    super.initState();
  }

  Future<void> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus =
          await Permission.notification.request();
      if (permissionStatus.isGranted) {
        // Permission is granted, perform the required action here
        // For example, show notifications
        // showNotification();
      } else {
        // Permission denied
        // You can show a message to the user indicating that they rejected the permission request
        // and provide guidance on how to enable the permission in settings.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await requestNotificationPermission();
                  notificationServices.sendNotifications(
                      "Zaeem", "Hello World");
                },
                child: Text('Notify'))
          ],
        ),
      )),
    );
  }
}
