enum Rarity {
  ordinary,
  common,
  uncommon,
  rare,
  unique,
  fabled,
}

Map _assetObjectCreator(String name, String imagePath, Rarity rarity) {
  double probability;

  switch (rarity) {
    case Rarity.ordinary:
      {
        probability = 0.50;
      }
      break;
    case Rarity.common:
      {
        probability = 0.35;
      }
      break;
    case Rarity.uncommon:
      {
        probability = 0.17;
      }
      break;
    case Rarity.rare:
      {
        probability = 0.10;
      }
      break;
    case Rarity.unique:
      {
        probability = 0.05;
      }
      break;
    case Rarity.fabled:
      {
        probability = 0.02;
      }
      break;
  }

  return {
    'name': name,
    'imagePath': imagePath,
    'probability': probability,
  };
}

class AssetLists {
  static List<Map> catList = [
    _assetObjectCreator(
        'Applebottom', 'assets/images/cats/applebottom.png', Rarity.uncommon),
    _assetObjectCreator(
        'Butter', 'assets/images/cats/butter.png', Rarity.common),
    _assetObjectCreator(
        'Gumayusi', 'assets/images/cats/gumayusi.png', Rarity.rare),
    _assetObjectCreator('Kahve', 'assets/images/cats/kahve.png', Rarity.unique),
    _assetObjectCreator('Kai', 'assets/images/cats/kai.png', Rarity.common),
    _assetObjectCreator(
        'Keria', 'assets/images/cats/keria.png', Rarity.uncommon),
    _assetObjectCreator(
        'Kingen', 'assets/images/cats/kingen.png', Rarity.fabled),
    _assetObjectCreator('Mouse', 'assets/images/cats/mouse.png', Rarity.rare),
    _assetObjectCreator(
        'Mrs. Grubsly', 'assets/images/cats/mrs_grubsly.png', Rarity.rare),
    _assetObjectCreator('Nigel', 'assets/images/cats/nigel.png', Rarity.common),
    _assetObjectCreator(
        'Poor Alexander', 'assets/images/cats/poor_alexander.png', Rarity.rare),
    _assetObjectCreator(
        'Van Winkle', 'assets/images/cats/van_winkle.png', Rarity.unique),
  ];

  static List<Map> eyeList = [
    _assetObjectCreator(
        'Blank',
        'assets/images/accessories/vibes/blank_background.png',
        Rarity.ordinary),
    _assetObjectCreator('Glasses 1',
        'assets/images/accessories/eyes/glasses_1.png', Rarity.common),
    _assetObjectCreator('Monocle 1',
        'assets/images/accessories/eyes/monocle_1.png', Rarity.rare),
    _assetObjectCreator('Sunglasses 1',
        'assets/images/accessories/eyes/sunglasses_1.png', Rarity.uncommon),
  ];

  static List<Map> headList = [
    _assetObjectCreator(
        'Blank',
        'assets/images/accessories/vibes/blank_background.png',
        Rarity.ordinary),
  ];

  static List<Map> pawList = [
    _assetObjectCreator(
        'Blank',
        'assets/images/accessories/vibes/blank_background.png',
        Rarity.ordinary),
    _assetObjectCreator(
        'Book 1', 'assets/images/accessories/paws/book_1.png', Rarity.common),
    _assetObjectCreator('Drink 1', 'assets/images/accessories/paws/drink_1.png',
        Rarity.uncommon),
    _assetObjectCreator(
        'Food 1', 'assets/images/accessories/paws/food_1.png', Rarity.common),
    _assetObjectCreator(
        'Food 2', 'assets/images/accessories/paws/food_2.png', Rarity.rare),
  ];

  static List<Map> vibeList = [
    _assetObjectCreator(
        'Blank',
        'assets/images/accessories/vibes/blank_background.png',
        Rarity.ordinary),
    _assetObjectCreator('Leaves 1',
        'assets/images/accessories/vibes/leaves_1.png', Rarity.uncommon),
    _assetObjectCreator(
        'Rain 1', 'assets/images/accessories/vibes/rain_1.png', Rarity.rare),
    _assetObjectCreator('Rainbow 1',
        'assets/images/accessories/vibes/rainbow_1.png', Rarity.fabled),
    _assetObjectCreator('Sparkles 1',
        'assets/images/accessories/vibes/sparkles_1.png', Rarity.unique),
  ];
}
