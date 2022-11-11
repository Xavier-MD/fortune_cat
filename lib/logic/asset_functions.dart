import 'dart:math';

class AssetFunctions {
  static double randomNumberGenerator(assetList) {
    double probabilitySum = 0;

    for (var i = 0; i < assetList.length; i++) {
      probabilitySum += assetList[i]['probability'];
    }
    Random random = Random();
    double randomNumber = random.nextDouble() * (probabilitySum);
    return randomNumber;
  }

  static dynamic assetSelectorRecursion(randomNumber, assetList, pointSum) {
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
