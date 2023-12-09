import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meals_item.dart';
import '../models/meal.dart';
import 'meal_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, this.title, required this.meals})
      : super(key: key);

  final String? title;
  final List<Meal> meals;

  void onSelectingMeal(Meal meal, BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      return MealDetailScreen(meal: meal);
    }
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealsItem(meal: meals[index], onSelectMeal: (meal){
          onSelectingMeal(meal, context);
        },);
      },
    );

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nothing Here :(",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          // Text(
          //   "Try looking some other category",
          //   textAlign: TextAlign.center,
          //   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          //         color: Theme.of(context).colorScheme.onBackground,
          //       ),
          // ),
        ],
      ));
    }


    if (title == null){
      return content;
    }
    else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: content);
    }
  }
}
