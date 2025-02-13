import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_look/config/routing/routes.dart';
import '../../home_root_page.dart';
import '../../src/clothing_set/presentation/clothing_set_container.dart';
import '../../src/explore/presentation/explore_page.dart';

final GlobalKey<NavigatorState> _roottNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootShell');
final GlobalKey<NavigatorState> _mainNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainShell');
final GlobalKey<NavigatorState> _eventNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'eventShell');

final router = GoRouter(
  navigatorKey: _roottNavigatorKey,
  redirect: (context, state) => _handleRedirect(context, state),
  initialLocation: Routes.explore(),
  routes: [
    ShellRoute(
      parentNavigatorKey: _roottNavigatorKey,
      navigatorKey: _mainNavigatorKey,
      builder: (context, state, child) {
        return HomeRootPage(page: child);
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _mainNavigatorKey,
          path: "/explore", // Removendo os parâmetros dinâmicos daqui
          pageBuilder: (context, state) {
            // Pegando os parâmetros da URL
            final gender = state.uri.queryParameters['gender'];
            final style = state.uri.queryParameters['style'];
            return NoTransitionPage(
              child: ExplorePage(gender: gender, style: style),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _mainNavigatorKey,
          path: "/explore/set/{id}", // Removendo os parâmetros dinâmicos daqui
          pageBuilder: (context, state) {
            String id = state.pathParameters['id']!;
            return NoTransitionPage(
              child: ClothingSetPage(
                clothingSetId: id,
              ),
            );
          },
        ),
      ],
    ),
  ],
);

Future<String?> _handleRedirect(BuildContext context, GoRouterState state) async {
  return null;
}

class SlideTransitionRoute extends GoRoute {
  final Widget page;
  SlideTransitionRoute({required super.path, required this.page})
      : super(
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 200),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            child: page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final enterAnimation = Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(
                position: enterAnimation,
                child: child,
              );
            },
          ),
        );
}
