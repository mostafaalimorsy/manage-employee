import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  bool get isSvg => assetPath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
    )
        : Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
