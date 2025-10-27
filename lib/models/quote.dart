class Quote {
  final String text;
  final String author;
  final Category category;

  Quote({
    required this.text,
    required this.author,
    required this.category,
  });
}

enum Category {
  motivation,
  life,
  success,
  love,
  friendship,
  wisdom,
  happiness,
  courage,
  strength,
  dreams,
}

extension CategoryExtension on Category {
  String get displayName {
    return name[0].toUpperCase() + name.substring(1);
  }

  String get emoji {
    switch (this) {
      case Category.motivation:
        return '🔥';
      case Category.life:
        return '🌱';
      case Category.success:
        return '🎯';
      case Category.love:
        return '❤️';
      case Category.friendship:
        return '🤝';
      case Category.wisdom:
        return '🧠';
      case Category.happiness:
        return '😊';
      case Category.courage:
        return '🦁';
      case Category.strength:
        return '💪';
      case Category.dreams:
        return '✨';
    }
  }
}

