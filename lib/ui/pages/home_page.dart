import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:fortune_cat/models/asset_lists.dart';
import 'package:fortune_cat/models/text_lists.dart';
import 'package:fortune_cat/ui/components/fc_svg.dart';
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

  void refreshAssets() {
    setState(() {
      initializeAssets();
    });
  }

  @override
  void initState() {
    super.initState();
    initializeAssets();
  }

  Widget catAssetLayer(String assetPath) {
    return Image(
      fit: BoxFit.contain,
      image: AssetImage(assetPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFfff8ef),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 2),
              blurRadius: 15.0.w,
              spreadRadius: 3.0.w,
              color: const Color.fromARGB(255, 212, 201, 180),
              inset: true,
            ),
          ],
        ),
        child: SafeArea(
          minimum: EdgeInsets.fromLTRB(5.0.w, 5.0.h, 5.0.w, 0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              // Cat Picture Section
              Flexible(
                flex: 7,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FcSvg(
                            assetName: 'assets/vectors/icons/tarot_icon.svg',
                            width: 10.0.w,
                            color: Colors.black,
                          ),
                          FcSvg(
                            assetName: 'assets/vectors/text/home_text.svg',
                            width: 40.0.w,
                            color: Colors.black,
                          ),
                          FcSvg(
                            assetName: 'assets/vectors/icons/settings_icon.svg',
                            width: 10.0.w,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Flexible(
                      flex: 10,
                      child: Stack(
                        children: [
                          catAssetLayer(selectedVibe),
                          catAssetLayer(selectedCat),
                          catAssetLayer(selectedEyeAccessory),
                          catAssetLayer(selectedHeadAccessory),
                          catAssetLayer(selectedPawAccessory),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Fortune Quote Section
              Flexible(
                flex: 3,
                child: SizedBox(
                  width: 80.0.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FcSvg(
                          assetName:
                              'assets/vectors/decor/quote_upper_bracket.svg'),
                      SizedBox(
                        width: 70.0.w,
                        child: Text(
                          selectedQuote,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 21.0.sp,
                          ),
                        ),
                      ),
                      FcSvg(
                          assetName:
                              'assets/vectors/decor/quote_lower_bracket.svg'),
                    ],
                  ),
                ),
              ),

              // Third Section
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FcSvg(
                      assetName: 'assets/vectors/icons/cat_icon.svg',
                      width: 10.0.w,
                      color: Colors.black,
                    ),
                    Chip(
                      label: Text('writing'),
                    ),
                    FcSvg(
                      assetName: 'assets/vectors/icons/tarot_icon.svg',
                      width: 10.0.w,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
