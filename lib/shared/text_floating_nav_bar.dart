import 'package:flutter/material.dart';
import 'package:snap_look/shared/app_container.dart';

class TextFloatingNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int idx, String route) onTap;
  final List<TextFloatNavigationItem> items;

  const TextFloatingNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.items,
  });

  @override
  State<TextFloatingNavBar> createState() => _TextFloatingNavBarState();
}

class _TextFloatingNavBarState extends State<TextFloatingNavBar> {
  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigation();
  }

  _buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppContainer(
            borderRadius: 100,
            padding: const EdgeInsets.all(8),
            child: Row(
              spacing: 6,
              children: widget.items.map((item) => _buildItem(item)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(TextFloatNavigationItem item) {
    bool isSelected = widget.currentIndex == widget.items.indexOf(item);

    return FilledButton.tonal(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
        backgroundColor: WidgetStatePropertyAll(
          isSelected ? Colors.black : Colors.white,
        ),
      ),
      onPressed: () => widget.onTap(widget.items.indexOf(item), item.route),
      child: Text(item.text, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
    );
  }
}

class TextFloatNavigationItem {
  final String route;
  final String text;

  TextFloatNavigationItem({required this.route, required this.text});
}
