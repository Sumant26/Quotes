# Daily Quotes App

An elegant Flutter application that delivers inspirational quotes every day. Customize your experience by selecting quote categories and discover random quotes at any time.

## Features

- **Daily Quotes**: Get a unique quote every day based on the current date
- **Category Selection**: Choose from 10 different categories including Motivation, Life, Success, Love, Friendship, Wisdom, Happiness, Courage, Strength, and Dreams
- **Random Quotes**: Get random quotes instantly with a single tap
- **Dark Mode**: Toggle between light and dark themes for comfortable viewing
- **Favorites**: Save your favorite quotes locally
- **Share Quotes**: Share inspirational quotes on social media or with friends
- **Scheduled Notifications**: Set up daily quote notifications at your preferred time
- **Offline Functionality**: All quotes are stored locally - no internet required
- **Elegant UI**: Beautiful gradient backgrounds, smooth animations, and modern Material Design 3
- **Personalized Experience**: Select multiple categories to filter quotes according to your preferences

## How to Use

1. **View Daily Quote**: Open the app to see today's quote automatically
2. **Get Random Quote**: Tap the "Random" button for a surprise quote
3. **Favorite Quotes**: Tap the heart icon to save quotes to your favorites
4. **Share Quotes**: Tap the share icon to share quotes on social media
5. **Select Categories**: Click the category icon to choose your preferred categories
6. **Change Theme**: Tap settings icon and toggle between light/dark mode
7. **View Favorites**: Access your saved quotes from the settings menu
8. **Schedule Notifications**: Set up daily quote reminders from the settings

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone [your-repo-url]
cd quotes
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                      # App entry point with theme support
├── models/
│   └── quote.dart                 # Quote and Category models
├── data/
│   └── quote_repository.dart      # Quote data and business logic
├── services/
│   ├── favorites_service.dart     # Local favorites management
│   ├── preferences_service.dart   # User preferences storage
│   └── scheduler_service.dart     # Notification scheduling
└── screens/
    ├── quote_display_screen.dart  # Main screen with quote display
    ├── category_selection_screen.dart  # Category selection interface
    └── schedule_screen.dart       # Notification scheduling interface
```

## Features in Detail

### Daily Quotes
Each day, the app selects a quote based on a seed derived from the current date, ensuring consistency while appearing fresh.

### Random Quotes
Get instant inspiration by tapping the random button for quotes from your selected categories.

### Category System
- **Motivation** 🔥: Inspiring quotes to push you forward
- **Life** 🌱: Wisdom about living life to the fullest
- **Success** 🎯: Quotes about achievement and progress
- **Love** ❤️: Quotes about relationships and affection
- **Friendship** 🤝: Quotes celebrating companionship
- **Wisdom** 🧠: Thought-provoking insights
- **Happiness** 😊: Quotes about joy and contentment
- **Courage** 🦁: Quotes about bravery and overcoming fear
- **Strength** 💪: Quotes about inner power and resilience
- **Dreams** ✨: Quotes about aspirations and goals

## Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **Material Design 3**: Modern design system
- **shared_preferences**: Local data persistence for favorites and settings
- **share_plus**: Social media sharing functionality
- **flutter_local_notifications**: Daily quote notifications
- **intl**: Internationalization and time formatting

## Features in Detail

### Dark Mode
Toggle between light and dark themes through the settings menu. Your preference is saved and remembered across app restarts.

### Favorites
Tap the heart icon to add quotes to your favorites collection. All favorites are stored locally on your device. Access your favorites anytime from the settings menu.

### Share Quotes
Share your favorite quotes on social media platforms like Twitter, Facebook, WhatsApp, and more with just one tap.

### Scheduled Notifications
Set up daily quote notifications at your preferred time. Choose the time that works best for your daily inspiration moment.

## License

This project is open source and available for personal and commercial use.

---

Built with ❤️ using Flutter
