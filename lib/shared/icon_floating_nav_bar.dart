import 'package:flutter/material.dart';
import 'package:snap_look/shared/app_container.dart';

class IconFloatingNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int idx, String route) onTap;
  final List<IconFloatNavigationItem> items;

  const IconFloatingNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.items,
  });

  @override
  State<IconFloatingNavBar> createState() => _IconFloatingNavBarState();
}

class _IconFloatingNavBarState extends State<IconFloatingNavBar> {
  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigation();
  }

  _buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppContainer(
            borderRadius: 100,
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: 6,
              children: widget.items.map((item) => _buildItem(item)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconFloatNavigationItem item) {
    bool isSelected = widget.currentIndex == widget.items.indexOf(item);

    return IconButton(
      color: isSelected ? Colors.white : Colors.black,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
        backgroundColor: WidgetStatePropertyAll(
          isSelected ? Colors.black : Colors.white,
        ),
      ),
      onPressed: () => widget.onTap(widget.items.indexOf(item), item.route),
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : Colors.black,
          BlendMode.srcIn,
        ),
        child: item.image,
      ),
    );
  }
}

class IconFloatNavigationItem {
  final String route;
  final Image image;

  IconFloatNavigationItem({required this.route, required this.image});
}
