import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FcSvg extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final Color? color;

  const FcSvg({
    Key? key,
    required this.assetName,
    this.width,
    this.height,
    this.boxFit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: boxFit,
      color: color,
    );
  }
}
