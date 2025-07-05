// // this will be used as notification channel id
import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

// // this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;

// @pragma('vm:entry-point')
// Future<void> _onDidReceiveBackgroundNotificationResponse(
//     NotificationResponse message) async {
//   print("BG TAATTTT " + " --- " * 20);
// }

// class NotificationsService {
//   show() async {
//     tz.initializeTimeZones();

//     // WidgetsFlutterBinding.ensureInitialized();

//     print("trying to show notification" * 20);

//     final FlutterLocalNotificationsPlugin localNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     bool? initialised = await localNotificationsPlugin.initialize(
//       InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       ),
//       onDidReceiveBackgroundNotificationResponse:
//           _onDidReceiveBackgroundNotificationResponse,
//       onDidReceiveNotificationResponse: (message) async {},
//     );

//     print("INITALISED --> ${initialised}");

//     await localNotificationsPlugin.zonedSchedule(
//       0,
//       'scheduled title',
//       'scheduled body',
//       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'full screen channel id',
//           'full screen channel name',
//           channelDescription: 'full screen channel description',
//           priority: Priority.high,
//           importance: Importance.high,
//           fullScreenIntent: true,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );

//     print("show notification");
//   }
// }

class NotificationsService {
  final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();

    await localNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        ),
      ),
      onDidReceiveNotificationResponse: (message) async {
        print("Notification tapped: $message");
      },
    );
  }

  Future<void> show(Map<String, dynamic> message) async {
    // Extract title and body from the incoming Aliyun Push message payload
    String title = message['title'] ?? 'New Notification';
    String body = message['content'] ?? 'You have received a new message';

    await localNotificationsPlugin.show(
      notificationId,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id_4',
          'Full Screen Channel',
          channelDescription: 'This is used for important notifications',
          priority: Priority.high,
          importance: Importance.high,
          fullScreenIntent: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
        ),
      ),
      payload: body,
    );
  }
}
