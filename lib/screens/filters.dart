import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => const TabsScreen()));
      //   }
      // }),
      body: Column(
        children: [
          SwitchListItem(
            activeFilters: activeFilters,
            ref: ref,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            filter: Filter.glutenFree,
          ),
          SwitchListItem(
            activeFilters: activeFilters,
            ref: ref,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            filter: Filter.lactoseFree,
          ),
          SwitchListItem(
            activeFilters: activeFilters,
            ref: ref,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            filter: Filter.vegetarian,
          ),
          SwitchListItem(
            activeFilters: activeFilters,
            ref: ref,
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            filter: Filter.vegan,
          ),
          // SwitchListTile(
          //   value: activeFilters[Filter.lactoseFree]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.lactoseFree, isChecked);
          //   },
          //   title: Text(
          //     'Lactose-free',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     'Only include lactose-free meals.',
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(
          //     left: 34,
          //     right: 32,
          //   ),
          // ),
          // SwitchListTile(
          //   value: activeFilters[Filter.vegetarian]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.vegetarian, isChecked);
          //   },
          //   title: Text(
          //     'Vegetarian-free',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     'Only include vegetarian-free meals.',
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(
          //     left: 34,
          //     right: 32,
          //   ),
          // ),
          // SwitchListTile(
          //   value: activeFilters[Filter.vegan]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.vegan, isChecked);
          //   },
          //   title: Text(
          //     'Vegan-free',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     'Only include vegan-free meals.',
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(
          //     left: 34,
          //     right: 32,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SwitchListItem extends StatelessWidget {
  const SwitchListItem({
    super.key,
    required this.activeFilters,
    required this.ref,
    required this.filter,
    required this.title,
    required this.subtitle,
  });

  final WidgetRef ref;
  final Map<Filter, bool> activeFilters;
  final Filter filter;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: activeFilters[filter]!,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 32,
      ),
    );
  }
}
