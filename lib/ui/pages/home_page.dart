import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_cat/functions/select_random_list_item.dart';
import 'package:fortune_cat/models/asset_lists.dart';
import 'package:fortune_cat/models/text_lists.dart';
import 'package:fortune_cat/ui/components/fc_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            // Fortune Quote Section
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  FcSvg(
                      assetName:
                          'assets/vectors/decor/quote_upper_bracket.svg'),
                  const Spacer(),
                  Text(selectedQuote),
                  const Spacer(),
                  FcSvg(
                      assetName:
                          'assets/vectors/decor/quote_lower_bracket.svg'),
                ],
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
      backgroundColor: const Color(0xFFfef8e8),
    );
  }
}
