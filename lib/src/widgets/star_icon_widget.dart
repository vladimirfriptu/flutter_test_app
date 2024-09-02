import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarIconWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  final String _assetPath = 'assets/star.svg';

  const StarIconWidget({
    super.key,
    required this.width,
    required this.height,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        right: right,
        left: left,
        bottom: bottom,
        child: SvgPicture.asset(_assetPath, width: width, height: height)
    );
  }
}