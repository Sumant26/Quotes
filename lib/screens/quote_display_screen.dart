import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote.dart';
import '../data/quote_repository.dart';
import '../services/favorites_service.dart';
import 'category_selection_screen.dart';
import 'schedule_screen.dart';

class QuoteDisplayScreen extends StatefulWidget {
  final Function(bool) onThemeToggle;
  final bool isDarkMode;

  const QuoteDisplayScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<QuoteDisplayScreen> createState() => _QuoteDisplayScreenState();
}

class _QuoteDisplayScreenState extends State<QuoteDisplayScreen> {
  List<Category> _selectedCategories = Category.values;
  Quote _currentQuote = QuoteRepository.getDailyQuote();
  bool _isLoading = false;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadQuoteOfDay();
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() async {
    final isFav = await FavoritesService.isFavorite(_currentQuote);
    if (mounted) {
      setState(() {
        _isFavorite = isFav;
      });
    }
  }

  void _loadQuoteOfDay() async {
    setState(() {
      _isLoading = true;
    });
    
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() {
        _currentQuote = QuoteRepository.getQuoteOfDay(_selectedCategories);
        _isLoading = false;
      });
      _checkFavoriteStatus();
    }
  }

  void _getRandomQuote() async {
    setState(() {
      _isLoading = true;
    });
    
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() {
        _currentQuote = QuoteRepository.getRandomQuoteFromCategories(_selectedCategories);
        _isLoading = false;
      });
      _checkFavoriteStatus();
    }
  }

  Future<void> _shareQuote() async {
    final text = '${_currentQuote.text}\n\n- ${_currentQuote.author}\n\n${_currentQuote.category.emoji} ${_currentQuote.category.displayName}';
    await Share.share(
      text,
      subject: 'Inspirational Quote',
    );
  }

  Future<void> _toggleFavorite() async {
    if (_isFavorite) {
      await FavoritesService.removeFavorite(_currentQuote);
    } else {
      await FavoritesService.addFavorite(_currentQuote);
    }
    if (mounted) {
      setState(() {
        _isFavorite = !_isFavorite;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isFavorite ? 'Quote removed from favorites' : 'Quote added to favorites',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  Future<void> _selectCategories() async {
    final categories = await Navigator.of(context).push<List<Category>>(
      MaterialPageRoute(
        builder: (context) => const CategorySelectionScreen(),
      ),
    );

    if (categories != null && categories.isNotEmpty) {
      setState(() {
        _selectedCategories = categories;
      });
      _loadQuoteOfDay();
    }
  }

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
                title: const Text('Theme'),
                subtitle: Text(widget.isDarkMode ? 'Dark Mode' : 'Light Mode'),
                trailing: Switch(
                  value: widget.isDarkMode,
                  onChanged: (value) {
                    widget.onThemeToggle(value);
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('View Favorites'),
                onTap: () {
                  Navigator.pop(context);
                  _showFavorites();
                },
              ),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('Schedule Quotes'),
                subtitle: const Text('Set up daily notifications'),
                onTap: () {
                  Navigator.pop(context);
                  _showSchedule();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSchedule() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScheduleScreen(
          selectedCategories: _selectedCategories,
        ),
      ),
    );
  }

  void _showFavorites() async {
    final favorites = await FavoritesService.getFavorites();
    
    if (!mounted) return;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Favorite Quotes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: favorites.isEmpty
                    ? const Center(
                        child: Text('No favorite quotes yet'),
                      )
                    : ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final quote = favorites[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: ListTile(
                              title: Text(
                                quote.text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                '- ${quote.author}',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              leading: Text(
                                quote.category.emoji,
                                style: const TextStyle(fontSize: 24),
                              ),
                              onTap: () {
                                setState(() {
                                  _currentQuote = quote;
                                });
                                _checkFavoriteStatus();
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getGradientColor1() {
    return widget.isDarkMode ? Colors.blue.shade900 : Colors.blue.shade50;
  }

  Color _getGradientColor2() {
    return widget.isDarkMode ? Colors.purple.shade900 : Colors.purple.shade50;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _getGradientColor1(),
              _getGradientColor2(),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Daily Quotes',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, size: 28),
                      color: _isFavorite ? Colors.red : null,
                      onPressed: _toggleFavorite,
                      tooltip: 'Favorite',
                    ),
                    IconButton(
                      icon: const Icon(Icons.share, size: 28),
                      onPressed: _shareQuote,
                      tooltip: 'Share',
                    ),
                    IconButton(
                      icon: const Icon(Icons.category, size: 28),
                      onPressed: _selectCategories,
                      tooltip: 'Select Categories',
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, size: 28),
                      onPressed: _showSettings,
                      tooltip: 'Settings',
                    ),
                  ],
                ),
              ),

              // Quote Display
              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : SingleChildScrollView(
                            key: ValueKey(_currentQuote.text),
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                        _currentQuote.category.emoji,
                                        style: const TextStyle(fontSize: 64),
                                      ),
                                      const SizedBox(height: 24),
                                      Text(
                                        _currentQuote.text,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          height: 1.6,
                                          letterSpacing: 0.5,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 32),
                                      Container(
                                        width: 80,
                                        height: 2,
                                        color: Colors.blue.shade300,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        _currentQuote.author,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade700,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        _currentQuote.category.displayName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ),

              // Bottom buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _getRandomQuote,
                        icon: const Icon(Icons.shuffle),
                        label: const Text('Random'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _loadQuoteOfDay,
                        icon: const Icon(Icons.today),
                        label: const Text('Daily'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

