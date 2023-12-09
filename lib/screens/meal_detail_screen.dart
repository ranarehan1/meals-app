import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';
import 'package:meal_app/providers/favourites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealIsFavouriteOrNot = ref.watch(favouriteMealsProvider);
    final isFavourite = mealIsFavouriteOrNot.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              final wasAdded = ref
                  .read(favouriteMealsProvider.notifier)
                  .onSelectingFavouriteMeals(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? "Meal is added to favourites"
                      : "Meal is removed from favourites"),
                ),
              );
            },
            child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween(
                        begin: 0.8,
                        end: 1.0,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: isFavourite
                      ? Icon(
                          key: ValueKey(isFavourite),
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : Icon(
                          Icons.star_border,
                          key: ValueKey(isFavourite),
                        ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            const SizedBox(height: 20),
            Text(
              "Steps to make",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
