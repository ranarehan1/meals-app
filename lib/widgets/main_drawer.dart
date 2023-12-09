import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ],
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
          )),
          padding: const EdgeInsets.all(0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Icon(
                Icons.fastfood,
                size: 45,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                "Cooking Up!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: (){
            onSelectScreen("meals");
    },
          title: Text(
            "Meals",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
          ),
          leading: Icon(
            Icons.restaurant,
            size: 25,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
        ListTile(
          onTap: () {
            onSelectScreen("filters");
          },
          title: Text(
            "Filters",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
          ),
          leading: Icon(
            Icons.settings,
            size: 25,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
      ],
    ));
  }
}
