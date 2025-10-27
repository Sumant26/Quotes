import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _themeKey = 'theme_mode';
  static const String _scheduledTimeKey = 'scheduled_time';
  static const String _notificationsEnabledKey = 'notifications_enabled';

  /// Save theme preference (light/dark)
  static Future<bool> setThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(_themeKey, isDark);
  }

  /// Get theme preference
  static Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  /// Save scheduled notification time
  static Future<bool> setScheduledTime(String time) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_scheduledTimeKey, time);
  }

  /// Get scheduled notification time
  static Future<String?> getScheduledTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_scheduledTimeKey);
  }

  /// Enable/disable notifications
  static Future<bool> setNotificationsEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(_notificationsEnabledKey, enabled);
  }

  /// Check if notifications are enabled
  static Future<bool> getNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationsEnabledKey) ?? false;
  }
}

