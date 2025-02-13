import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_look/config/routing/routes.dart';
import 'shared/app_container.dart';
import 'shared/icon_floating_nav_bar.dart';
import 'shared/text_floating_nav_bar.dart';

class HomeRootPage extends StatefulWidget {
  final Widget page;
  const HomeRootPage({super.key, required this.page});

  @override
  State<HomeRootPage> createState() => _HomeRootPageState();
}

class _HomeRootPageState extends State<HomeRootPage> {
  late List<IconFloatNavigationItem> navItems;
  int currentIndex = 0;
  bool iniated = false;

  void _switchBranch(int index) {
    int lastIdx = currentIndex;
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
      if (lastIdx == 0) {
        context.push(navItems[index].route);
      } else {
        context.pushReplacement(navItems[index].route);
      }
    }
  }

  @override
  void didUpdateWidget(covariant HomeRootPage oldWidget) {
    final String? path = GoRouter.of(context).routerDelegate.state.fullPath;
    if (path == '/') {
      setState(() {
        currentIndex = 0;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    navItems = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isScreenLarge = MediaQuery.of(context).size.width >= 1100;
    return SafeArea(
        child: Scaffold(
      body: isScreenLarge ? _buildWebBody() : _buildMobileBody(),
    ));
  }

  _buildTopBar() {
    return TextFloatingNavBar(onTap: (i, r) {}, currentIndex: 0, items: [
      TextFloatNavigationItem(route: Routes.explore(), text: 'Tudo'),
      TextFloatNavigationItem(route: '/casual', text: 'Casual'),
      TextFloatNavigationItem(route: '/social', text: 'Social'),
      TextFloatNavigationItem(route: '/sport', text: 'Sport'),
      TextFloatNavigationItem(route: '/party', text: 'Party'),
    ]);
  }

  _buildLeftBar() {
    return IconFloatingNavBar(
      currentIndex: 0,
      items: [
        IconFloatNavigationItem(
            route: '/home',
            image: Image.asset(
              'assets/images/select.png',
              height: 24,
              width: 24,
            )),
        IconFloatNavigationItem(
            route: '/home',
            image: Image.asset(
              'assets/images/man.png',
              height: 24,
              width: 24,
            )),
        IconFloatNavigationItem(
            route: '/home',
            image: Image.asset(
              'assets/images/woman.png',
              height: 24,
              width: 24,
            )),
        IconFloatNavigationItem(
            route: '/home',
            image: Image.asset(
              'assets/images/boy.png',
              height: 24,
              width: 24,
            )),
        IconFloatNavigationItem(
            route: '/home',
            image: Image.asset(
              'assets/images/girl.png',
              height: 24,
              width: 24,
            )),
      ],
      onTap: (int index, String route) {},
    );
  }

  _buildWebBody() {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg_3.jpg'), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTopBar(),
          Row(
            children: [
              Expanded(
                child: Align(alignment: Alignment(1, 0), child: _buildLeftBar()),
              ),
              AppContainer(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), height: screenWidth * 0.45, width: screenWidth * 0.65, child: widget.page),
              Expanded(child: SizedBox())
            ],
          ),
        ],
      ),
    );
  }

  _buildMobileBody() {
    return Column(
      children: [
        _buildTopBar(),
        Expanded(
          child: Row(
            children: [
              _buildLeftBar(),
              Expanded(child: widget.page),
            ],
          ),
        ),
      ],
    );
  }
}
