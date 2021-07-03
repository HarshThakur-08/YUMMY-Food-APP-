import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _setfilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this._setfilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _isVegan = false;
  var _lactoseFree = false;
  var _isVegetarian = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    _isVegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(String text, bool currentValue,
      String discription, Function updateValue) {
    return SwitchListTile(
      title: Text(text),
      value: currentValue,
      subtitle: Text(discription),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian,
                  };
                  widget._setfilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free', _glutenFree,
                    'only include gluten free meals.', (newvalue) {
                  setState(() {
                    _glutenFree = newvalue;
                  });
                }),
                _buildSwitchListTile('Lactose-Free', _lactoseFree,
                    'only include lactose free meals.', (newvalue) {
                  setState(() {
                    _lactoseFree = newvalue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', _isVegan, 'only include vegan meals.', (newvalue) {
                  setState(() {
                    _isVegan = newvalue;
                  });
                }),
                _buildSwitchListTile('Vegetarian', _isVegetarian,
                    'only include vegetarian meals.', (newvalue) {
                  setState(() {
                    _isVegetarian = newvalue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
