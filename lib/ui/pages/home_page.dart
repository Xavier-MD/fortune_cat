import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_cat/logic/asset_functions.dart';
import 'package:fortune_cat/models/asset_lists.dart';
import 'package:fortune_cat/models/text_lists.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Map assetSelector(assetList) {
  double randomNumber = AssetFunctions.randomNumberGenerator(assetList);
  Map selectedAsset =
      AssetFunctions.assetSelectorRecursion(randomNumber, assetList, 0);
  return selectedAsset;
}

String quoteSelector(quoteList) {
  Random random = Random();
  int randomNumber = random.nextInt(quoteList.length);

  return quoteList[randomNumber];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    late String selectedBackground =
        assetSelector(AssetLists.backgroundList)['imagePath'];
    late String selectedCat = assetSelector(AssetLists.catList)['imagePath'];
    late String selectedEyeAccessory =
        assetSelector(AssetLists.eyeList)['imagePath'];
    late String selectedHeadAccessory =
        assetSelector(AssetLists.headList)['imagePath'];
    late String selectedPawAccessory =
        assetSelector(AssetLists.pawList)['imagePath'];
    late String selectedVibe = assetSelector(AssetLists.vibeList)['imagePath'];

    late String selectedQuote = quoteSelector(TextLists.quoteList);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortune Cat'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.star_border_rounded),
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
                    Image(
                      width: 80.0.w,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(selectedVibe),
                    ),
                    Image(
                      width: 80.0.w,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(selectedCat),
                    ),
                    Image(
                      width: 80.0.w,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(selectedEyeAccessory),
                    ),
                    Image(
                      width: 80.0.w,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(selectedHeadAccessory),
                    ),
                    Image(
                      width: 80.0.w,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(selectedPawAccessory),
                    ),
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
                    style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w600),
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
