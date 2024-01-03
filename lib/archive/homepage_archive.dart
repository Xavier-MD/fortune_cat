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
        actions: [
          IconButton(
            onPressed: refreshCatCombination,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              width: 100.0.w,
              height: 100.0.h,
              fit: BoxFit.fill,
              image: AssetImage(selectedBackground),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    catAssetLayer(selectedVibe),
                    catAssetLayer(selectedCat),
                    catAssetLayer(selectedEyeAccessory),
                    catAssetLayer(selectedHeadAccessory),
                    catAssetLayer(selectedPawAccessory),
                  ],
                ),
                SizedBox(height: 5.0.h),
                Container(
                  width: 80.0.w,
                  height: 20.0.h,
                  padding: EdgeInsets.all(2.0.h),
                  child: Text(
                    selectedQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17.0.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
