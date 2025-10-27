import 'dart:math';
import '../models/quote.dart';

class QuoteRepository {
  static final List<Quote> _allQuotes = [
    // Motivation
    Quote(
      text: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
      category: Category.motivation,
    ),
    Quote(
      text: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
      category: Category.motivation,
    ),
    Quote(
      text: "Don't watch the clock; do what it does. Keep going.",
      author: "Sam Levenson",
      category: Category.motivation,
    ),
    Quote(
      text: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      author: "Winston Churchill",
      category: Category.motivation,
    ),
    Quote(
      text: "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
      category: Category.motivation,
    ),

    // Life
    Quote(
      text: "Life is what happens when you're busy making other plans.",
      author: "John Lennon",
      category: Category.life,
    ),
    Quote(
      text: "In the end, it's not the years in your life that count. It's the life in your years.",
      author: "Abraham Lincoln",
      category: Category.life,
    ),
    Quote(
      text: "Life is like riding a bicycle. To keep your balance, you must keep moving.",
      author: "Albert Einstein",
      category: Category.life,
    ),
    Quote(
      text: "The purpose of our lives is to be happy.",
      author: "Dalai Lama",
      category: Category.life,
    ),
    Quote(
      text: "Life is beautiful, especially when you're happy.",
      author: "Unknown",
      category: Category.life,
    ),

    // Success
    Quote(
      text: "Success is not the key to happiness. Happiness is the key to success.",
      author: "Albert Schweitzer",
      category: Category.success,
    ),
    Quote(
      text: "The way to get started is to quit talking and begin doing.",
      author: "Walt Disney",
      category: Category.success,
    ),
    Quote(
      text: "Don't be afraid to give up the good to go for the great.",
      author: "John D. Rockefeller",
      category: Category.success,
    ),
    Quote(
      text: "I find that the harder I work, the more luck I seem to have.",
      author: "Thomas Jefferson",
      category: Category.success,
    ),
    Quote(
      text: "Try not to become a person of success, but rather try to become a person of value.",
      author: "Albert Einstein",
      category: Category.success,
    ),

    // Love
    Quote(
      text: "The best thing to hold onto in life is each other.",
      author: "Audrey Hepburn",
      category: Category.love,
    ),
    Quote(
      text: "We loved with a love that was more than love.",
      author: "Edgar Allan Poe",
      category: Category.love,
    ),
    Quote(
      text: "To love and be loved is to feel the sun from both sides.",
      author: "David Viscott",
      category: Category.love,
    ),
    Quote(
      text: "Love is composed of a single soul inhabiting two bodies.",
      author: "Aristotle",
      category: Category.love,
    ),
    Quote(
      text: "Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.",
      author: "Lao Tzu",
      category: Category.love,
    ),

    // Friendship
    Quote(
      text: "A real friend is one who walks in when the rest of the world walks out.",
      author: "Walter Winchell",
      category: Category.friendship,
    ),
    Quote(
      text: "Friendship is born at that moment when one person says to another: 'What! You too? I thought I was the only one.'",
      author: "C.S. Lewis",
      category: Category.friendship,
    ),
    Quote(
      text: "Friends are the family you choose.",
      author: "Jess C. Scott",
      category: Category.friendship,
    ),
    Quote(
      text: "A true friend is someone who is there for you when he'd rather be anywhere else.",
      author: "Len Wein",
      category: Category.friendship,
    ),
    Quote(
      text: "Friendship is the only cement that will ever hold the world together.",
      author: "Woodrow Wilson",
      category: Category.friendship,
    ),

    // Wisdom
    Quote(
      text: "The only true wisdom is in knowing you know nothing.",
      author: "Socrates",
      category: Category.wisdom,
    ),
    Quote(
      text: "Wisdom is not a product of schooling but of the lifelong attempt to acquire it.",
      author: "Albert Einstein",
      category: Category.wisdom,
    ),
    Quote(
      text: "It is better to remain silent at the risk of being thought a fool, than to talk and remove all doubt of it.",
      author: "Maurice Switzer",
      category: Category.wisdom,
    ),
    Quote(
      text: "Knowledge speaks, but wisdom listens.",
      author: "Jimi Hendrix",
      category: Category.wisdom,
    ),
    Quote(
      text: "The fear of the Lord is the beginning of wisdom.",
      author: "Proverbs 9:10",
      category: Category.wisdom,
    ),

    // Happiness
    Quote(
      text: "Happiness is not something ready made. It comes from your own actions.",
      author: "Dalai Lama",
      category: Category.happiness,
    ),
    Quote(
      text: "The purpose of life is to be happy.",
      author: "Dalai Lama",
      category: Category.happiness,
    ),
    Quote(
      text: "If you want to be happy, be.",
      author: "Leo Tolstoy",
      category: Category.happiness,
    ),
    Quote(
      text: "Happiness is a butterfly, which when pursued, is always just beyond your grasp, but which, if you will sit down quietly, may alight upon you.",
      author: "Nathaniel Hawthorne",
      category: Category.happiness,
    ),
    Quote(
      text: "The happiest people don't have the best of everything, they make the best of everything.",
      author: "Unknown",
      category: Category.happiness,
    ),

    // Courage
    Quote(
      text: "Courage is not the absence of fear, but action in spite of it.",
      author: "Mark Twain",
      category: Category.courage,
    ),
    Quote(
      text: "You gain strength, courage, and confidence by every experience in which you really stop to look fear in the face.",
      author: "Eleanor Roosevelt",
      category: Category.courage,
    ),
    Quote(
      text: "Have the courage to follow your heart and intuition. They somehow know what you truly want to become.",
      author: "Steve Jobs",
      category: Category.courage,
    ),
    Quote(
      text: "Courage is the first of human qualities because it is the quality which guarantees all others.",
      author: "Winston Churchill",
      category: Category.courage,
    ),
    Quote(
      text: "It takes courage to grow up and become who you really are.",
      author: "E.E. Cummings",
      category: Category.courage,
    ),

    // Strength
    Quote(
      text: "Strength does not come from physical capacity. It comes from an indomitable will.",
      author: "Mahatma Gandhi",
      category: Category.strength,
    ),
    Quote(
      text: "You must do the thing you think you cannot do.",
      author: "Eleanor Roosevelt",
      category: Category.strength,
    ),
    Quote(
      text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
      author: "Ralph Waldo Emerson",
      category: Category.strength,
    ),
    Quote(
      text: "The strongest people are not those who show strength in front of us but those who win battles we know nothing about.",
      author: "Unknown",
      category: Category.strength,
    ),
    Quote(
      text: "A smooth sea never made a skillful sailor.",
      author: "Franklin D. Roosevelt",
      category: Category.strength,
    ),

    // Dreams
    Quote(
      text: "All our dreams can come true if we have the courage to pursue them.",
      author: "Walt Disney",
      category: Category.dreams,
    ),
    Quote(
      text: "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
      category: Category.dreams,
    ),
    Quote(
      text: "Dream big and dare to fail.",
      author: "Norman Vaughan",
      category: Category.dreams,
    ),
    Quote(
      text: "Hold fast to dreams, for if dreams die, life is a broken bird that cannot fly.",
      author: "Langston Hughes",
      category: Category.dreams,
    ),
    Quote(
      text: "A dream doesn't become reality through magic; it takes sweat, determination, and hard work.",
      author: "Colin Powell",
      category: Category.dreams,
    ),
  ];

  static final Random _random = Random();

  /// Get all quotes
  static List<Quote> getAllQuotes() {
    return _allQuotes;
  }

  /// Get quotes by category
  static List<Quote> getQuotesByCategory(Category category) {
    return _allQuotes.where((quote) => quote.category == category).toList();
  }

  /// Get quotes by multiple categories
  static List<Quote> getQuotesByCategories(List<Category> categories) {
    return _allQuotes.where((quote) => categories.contains(quote.category)).toList();
  }

  /// Get a random quote
  static Quote getRandomQuote() {
    return _allQuotes[_random.nextInt(_allQuotes.length)];
  }

  /// Get a random quote from specific categories
  static Quote getRandomQuoteFromCategories(List<Category> categories) {
    final filteredQuotes = getQuotesByCategories(categories);
    if (filteredQuotes.isEmpty) return getRandomQuote();
    return filteredQuotes[_random.nextInt(filteredQuotes.length)];
  }

  /// Get quote of the day based on seed
  static Quote getQuoteOfDay(List<Category> categories) {
    final filteredQuotes = getQuotesByCategories(categories);
    if (filteredQuotes.isEmpty) {
      return getDailyQuote();
    }
    
    final today = DateTime.now();
    final seed = today.year * 365 + today.month * 30 + today.day;
    final random = Random(seed);
    return filteredQuotes[random.nextInt(filteredQuotes.length)];
  }

  /// Get a daily quote without categories
  static Quote getDailyQuote() {
    final today = DateTime.now();
    final seed = today.year * 365 + today.month * 30 + today.day;
    final random = Random(seed);
    return _allQuotes[random.nextInt(_allQuotes.length)];
  }
}

