import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier() : super([]);

  bool onSelectingFavouriteMeals(Meal meal){
    final mealIsFavourite = state.contains(meal);
    if(mealIsFavourite == true){
      state = state.where((m){
        return m.id != meal.id;
      }).toList();
      return false;
    }else{
      state = [...state , meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref){
  return FavouriteMealsNotifier();
});