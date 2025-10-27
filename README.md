# Daily Quotes App

An elegant Flutter application that delivers inspirational quotes every day. Customize your experience by selecting quote categories and discover random quotes at any time.

## Features

- **Daily Quotes**: Get a unique quote every day based on the current date
- **Category Selection**: Choose from 10 different categories including Motivation, Life, Success, Love, Friendship, Wisdom, Happiness, Courage, Strength, and Dreams
- **Random Quotes**: Get random quotes instantly with a single tap
- **Elegant UI**: Beautiful gradient backgrounds, smooth animations, and modern Material Design 3
- **Personalized Experience**: Select multiple categories to filter quotes according to your preferences

## How to Use

1. **View Daily Quote**: Open the app to see today's quote automatically
2. **Get Random Quote**: Tap the "Random" button for a surprise quote
3. **Select Categories**: Click the category icon in the top right to choose your preferred categories
4. **Refresh Daily**: Tap the "Daily" button to reload today's quote

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
├── main.dart                      # App entry point
├── models/
│   └── quote.dart                 # Quote and Category models
├── data/
│   └── quote_repository.dart      # Quote data and business logic
└── screens/
    ├── quote_display_screen.dart  # Main screen with quote display
    └── category_selection_screen.dart  # Category selection interface
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

## Future Enhancements

- Save favorite quotes locally
- Share quotes on social media
- Dark mode support
- Offline functionality
- Personalized quote scheduling

## License

This project is open source and available for personal and commercial use.

---

Built with ❤️ using Flutter
