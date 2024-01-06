import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_cat/models/asset_lists.dart';
import 'package:fortune_cat/models/text_lists.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random random = Random();
  late String selectedBackground;
  late String selectedCat;
  late String selectedEyeAccessory;
  late String selectedHeadAccessory;
  late String selectedPawAccessory;
  late String selectedVibe;
  late String selectedQuote;

  T selectRandom<T>(List<T> list) {
    int randomNumber = random.nextInt(list.length);
    return list[randomNumber];
  }

  void initializeAssets() {
    // Selecting a random background asset
    Asset backgroundAsset = selectRandom(AssetLists.backgroundList);
    selectedBackground = backgroundAsset.imagePath;

    // Selecting a random cat asset
    Asset catAsset = selectRandom(AssetLists.catList);
    selectedCat = catAsset.imagePath;

    // Selecting a random eye accessory
    Asset eyeAccessory = selectRandom(AssetLists.eyeList);
    selectedEyeAccessory = eyeAccessory.imagePath;

    // Selecting a random head accessory
    Asset headAccessory = selectRandom(AssetLists.headList);
    selectedHeadAccessory = headAccessory.imagePath;

    // Selecting a random paw accessory
    Asset pawAccessory = selectRandom(AssetLists.pawList);
    selectedPawAccessory = pawAccessory.imagePath;

    // Selecting a random vibe
    Asset vibe = selectRandom(AssetLists.vibeList);
    selectedVibe = vibe.imagePath;

    // Selecting a random quote
    selectedQuote = selectRandom(TextLists.quoteList);
  }

  @override
  void initState() {
    super.initState();
    initializeAssets();
  }

  void refreshCatCombination() {
    setState(() {
      initializeAssets();
    });
  }

  Widget catAssetLayer(String assetPath) {
    return Image(
      width: 80.0.h,
      fit: BoxFit.contain,
      image: AssetImage(assetPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VignetteBackground(),
    );
  }
}

class VignetteBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = RadialGradient(
      center: Alignment.center,
      radius: 0.5,
      colors: [Colors.transparent, Colors.black],
      stops: [0.5, 1.0],
    );

    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VignetteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VignetteBackgroundPainter(),
      child: Container(), // Your main content goes here
    );
  }
}

