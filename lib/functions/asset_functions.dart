import 'dart:math';

import 'package:fortune_cat/models/asset_lists.dart';

class AssetFunctions {
  static double randomNumberGenerator(List<Asset> assetList, Random random) {
    double probabilitySum = 0;

    for (var i = 0; i < assetList.length; i++) {
      probabilitySum += assetList[i]['probability'];
    }
    double randomNumber = random.nextDouble() * (probabilitySum);
    return randomNumber;
  }

  static Asset assetSelectorRecursion(randomNumber, assetList, pointSum) {
    if (assetList.length == 1) {
      return assetList[0];
    }

    int medianListIndex = (assetList.length / 2).floor();
    double bisectedProbabilitySum = 0;
    List updatedAssetList = [];

    for (var i = 0; i < medianListIndex; i++) {
      bisectedProbabilitySum += assetList[i]['probability'];
    }

    if (randomNumber <= bisectedProbabilitySum + pointSum) {
      for (var i = 0; i < medianListIndex; i++) {
        updatedAssetList.add(assetList[i]);
      }
      return assetSelectorRecursion(randomNumber, updatedAssetList, pointSum);
    } else {
      for (var i = medianListIndex; i < assetList.length; i++) {
        updatedAssetList.add(assetList[i]);
      }
      return assetSelectorRecursion(
          randomNumber, updatedAssetList, pointSum + bisectedProbabilitySum);
    }
  }
}
