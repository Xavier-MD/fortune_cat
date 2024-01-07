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
      appBar: AppBar(
        title: const Text('Fortune Cat'),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        toolbarHeight: 15.0.h,
        backgroundColor: const Color(0xFFfef8e8),
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 7,
              child: Container(
                color: Colors.red,
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFfef8e8),
    );
  }
}
