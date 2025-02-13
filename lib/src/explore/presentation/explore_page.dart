import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_look/config/routing/routes.dart';
import 'package:snap_look/src/explore/presentation/components/explore_set_card.dart';
import 'package:snap_look/src/explore/presentation/explore_view.dart';

class ExplorePage extends StatefulWidget {
  final String? gender;
  final String? style;
  const ExplorePage({super.key, this.gender, this.style});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final view = ExploreView();
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: view.loadSets,
      builder: (context, child) {
        if (view.loadSets.running) return SizedBox();
        return GridView.builder(
          itemCount: view.sets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            final set = view.sets[index];
            return InkWell(
                onTap: () => context.push(
                      Routes.clothingSet(set.id),
                    ),
                child: ExploreSetCard(clothingSet: set));
          },
        );
      },
    );
  }
}
