import 'package:flutter/material.dart';
import 'screens/quote_display_screen.dart';
import 'services/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load theme preference
  final isDark = await PreferencesService.getThemeMode();
  runApp(QuotesApp(isDark: isDark));
}

class QuotesApp extends StatefulWidget {
  final bool isDark;
  
  const QuotesApp({super.key, required this.isDark});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDark;
  }

  void toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
    PreferencesService.setThemeMode(isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.grey[850],
        ),
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: QuoteDisplayScreen(
        onThemeToggle: toggleTheme,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}
