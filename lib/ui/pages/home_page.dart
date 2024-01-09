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

  late Asset backgroundAsset;
  late Asset catAsset;
  late Asset eyeAccessory;
  late Asset headAccessory;
  late Asset pawAccessory;
  late Asset vibe;
  late String selectedQuote;

  void initializeAssets() {
    Asset backgroundAsset =
        selectRandomListItem(AssetLists.backgroundList, random);
    Asset catAsset = selectRandomListItem(AssetLists.catList, random);
    Asset eyeAccessoryAsset = selectRandomListItem(AssetLists.eyeList, random);
    Asset headAccessoryAsset =
        selectRandomListItem(AssetLists.headList, random);
    Asset pawAccessoryAsset = selectRandomListItem(AssetLists.pawList, random);
    Asset vibeAsset = selectRandomListItem(AssetLists.vibeList, random);
    String selectedQuote = selectRandomListItem(TextLists.quoteList, random);
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
