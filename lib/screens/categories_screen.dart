import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
//as categories scree is our main screen we will have to add scaffold

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
