import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Favorites',
    },
  ];
  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        backgroundColor: Colors.indigo[900],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              // ignore: deprecated_member_use
              title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              // ignore: deprecated_member_use
              title: Text('Favorites')),
        ],
      ),
    );
  }
}
