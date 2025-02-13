import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  const AppContainer({super.key, this.width, this.height, required this.child, this.padding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      color: const Color.fromARGB(215, 175, 175, 175),
      blur: 7,
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
      width: width,
      height: height,
      padding: EdgeInsets.all(0),
      child: Container(padding: padding, decoration: BoxDecoration(border: Border.all(color: Colors.white.withAlpha(120)), borderRadius: BorderRadius.circular(30)), child: child),
    );
  }
}
