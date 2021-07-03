import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.indigo[900],
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Yummy',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.indigo[900],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Filter', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
