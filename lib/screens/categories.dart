import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key, 
    required this.onToggleFavorite,
    required this.availableMeals,
    });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

void _selectCategory(BuildContext context, Category category) {
  final filteredMeals = availableMeals
  .where((meal) => meal.categories.contains(category.id))
  .toList();


  Navigator.push( // can also be written as Navigator.of(context).push(route);
    context,
     MaterialPageRoute(
      builder: (cxt) =>  MealsScreen(
        title: category.title, 
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
        ),
         ),
         );
 
}
  
  @override
  Widget build(BuildContext context) {
   
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2 , 
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20 ),
        children:[
          //alternatively we map method can also be used
          for (final category in availableCategories)
          CategoryGridItem(category: category,
          onSelectCategory: () {  //3.set the parameter value
            _selectCategory(context, category); // 4. execute the defined function
          } ,
          )
          ],
    );
  }
}