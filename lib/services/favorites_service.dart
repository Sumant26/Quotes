import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote.dart';

class FavoritesService {
  static const String _key = 'favorite_quotes';

  /// Save a quote to favorites
  static Future<bool> addFavorite(Quote quote) async {
    final favorites = await getFavorites();
    
    // Check if already favorited
    if (favorites.any((q) => q.text == quote.text && q.author == quote.author)) {
      return false;
    }
    
    favorites.add(quote);
    return await _saveFavorites(favorites);
  }

  /// Remove a quote from favorites
  static Future<bool> removeFavorite(Quote quote) async {
    final favorites = await getFavorites();
    favorites.removeWhere((q) => q.text == quote.text && q.author == quote.author);
    return await _saveFavorites(favorites);
  }

  /// Check if a quote is favorited
  static Future<bool> isFavorite(Quote quote) async {
    final favorites = await getFavorites();
    return favorites.any((q) => q.text == quote.text && q.author == quote.author);
  }

  /// Get all favorite quotes
  static Future<List<Quote>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }
    
    try {
      final List<dynamic> decoded = json.decode(jsonString);
      return decoded.map((json) => Quote(
        text: json['text'] as String,
        author: json['author'] as String,
        category: Category.values.firstWhere(
          (c) => c.name == json['category'] as String,
          orElse: () => Category.life,
        ),
      )).toList();
    } catch (e) {
      return [];
    }
  }

  /// Save favorites to SharedPreferences
  static Future<bool> _saveFavorites(List<Quote> quotes) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(
      quotes.map((q) => {
        'text': q.text,
        'author': q.author,
        'category': q.category.name,
      }).toList(),
    );
    return await prefs.setString(_key, jsonString);
  }

  /// Clear all favorites
  static Future<bool> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_key);
  }
}

