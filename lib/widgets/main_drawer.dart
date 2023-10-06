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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const _DrawerHeaderLabel(),
          ),
          _DrawerMenuItem(
            icon: Icons.restaurant,
            title: 'Meals',
            onSelectScreen: onSelectScreen,
          ),
          _DrawerMenuItem(
            title: 'Filters',
            icon: Icons.settings,
            onSelectScreen: onSelectScreen,
          ),
        ],
      ),
    );
  }
}

class _DrawerHeaderLabel extends StatelessWidget {
  const _DrawerHeaderLabel();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.fastfood,
          size: 48,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          'Cooking up!',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  const _DrawerMenuItem(
      {required this.icon, required this.title, required this.onSelectScreen});

  final IconData icon;
  final String title;
  final void Function(String) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 22,
            ),
      ),
      onTap: () {
        onSelectScreen(title.toLowerCase());
      },
    );
  }
}
