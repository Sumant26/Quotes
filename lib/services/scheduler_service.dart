import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/quote.dart';
import '../data/quote_repository.dart';

class SchedulerService {
  static final FlutterLocalNotificationsPlugin _notifications = 
      FlutterLocalNotificationsPlugin();

  /// Initialize notifications
  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  /// Handle notification tap
  static void _onNotificationTap(NotificationResponse response) {
    // Handle notification tap if needed
  }

  /// Schedule daily notification at specific time
  static Future<void> scheduleDailyNotification({
    required String time,
    required List<Category> categories,
  }) async {
    // Cancel existing notification
    await _notifications.cancel(0);

    // Get today's quote
    final quote = QuoteRepository.getQuoteOfDay(categories);
    
    const androidDetails = AndroidNotificationDetails(
      'daily_quotes_channel',
      'Daily Quotes',
      channelDescription: 'Get inspired with daily quotes',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Note: Flutter local notifications doesn't support exact time scheduling
    // This is a simplified implementation
    // For production, consider using a different approach or background tasks
    
    await _notifications.show(
      0,
      'Daily Quote',
      quote.text,
      notificationDetails,
    );
  }

  /// Cancel all scheduled notifications
  static Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Check if notifications are permitted
  static Future<bool> requestPermissions() async {
    final androidImplementation = _notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    
    if (androidImplementation != null) {
      final bool? granted = await androidImplementation.requestNotificationsPermission();
      return granted ?? false;
    }
    
    final iosImplementation = _notifications.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    
    if (iosImplementation != null) {
      final bool? granted = await iosImplementation.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }
    
    return false;
  }
}

