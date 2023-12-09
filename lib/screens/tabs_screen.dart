import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals_screen.dart';
import '../providers/favourites_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;

  void onSelectedScreen(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onSelectScreenFromDrawer(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) {
          return const FiltersScreen();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(availableMealsProvider);
    Widget activePage = CategoriesScreen(filtersSetMeals: availableMeals);
    String activePageTitle = "Categories";

    if (selectedIndex == 1) {
      final favouriteMealsGettingWithProvider =
          ref.watch(favouriteMealsProvider);
      setState(() {
        activePage = MealsScreen(
          meals: favouriteMealsGettingWithProvider,
        );
        activePageTitle = "Your Favourites";
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: onSelectScreenFromDrawer),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onSelectedScreen,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
          ]),
    );
  }
}
