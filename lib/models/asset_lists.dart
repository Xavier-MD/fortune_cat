class Asset {
  final String name;
  final String imagePath;
  final double probability;

  Asset(
      {required this.name, required this.imagePath, required this.probability});
}

enum Rarity {
  ordinary,
  common,
  uncommon,
  rare,
  unique,
  fabled,
}

Asset assetObjectCreator(String name, String imagePath, Rarity rarity) {
  double probability;

  switch (rarity) {
    case Rarity.ordinary:
      probability = 0.50;
      break;
    case Rarity.common:
      probability = 0.35;
      break;
    case Rarity.uncommon:
      probability = 0.17;
      break;
    case Rarity.rare:
      probability = 0.10;
      break;
    case Rarity.unique:
      probability = 0.05;
      break;
    case Rarity.fabled:
      probability = 0.02;
      break;
  }

  return Asset(name: name, imagePath: imagePath, probability: probability);
}

class AssetLists {
  static List<Asset> backgroundList = [
    assetObjectCreator('Blank Background',
        'assets/images/backgrounds/blank_background.png', Rarity.common),
    assetObjectCreator('Blue Background',
        'assets/images/backgrounds/blue_background.png', Rarity.common),
    assetObjectCreator('Coral Background',
        'assets/images/backgrounds/coral_background.png', Rarity.common),
    assetObjectCreator('Pink Background',
        'assets/images/backgrounds/pink_background.png', Rarity.common),
    // Add more backgrounds as needed
  ];

  static List<Asset> catList = [
    assetObjectCreator(
        'Applebottom', 'assets/images/cats/applebottom.png', Rarity.uncommon),
    assetObjectCreator(
        'Butter', 'assets/images/cats/butter.png', Rarity.common),
    assetObjectCreator(
        'Gumayusi', 'assets/images/cats/gumayusi.png', Rarity.rare),
    assetObjectCreator('Kahve', 'assets/images/cats/kahve.png', Rarity.unique),
    assetObjectCreator('Kai', 'assets/images/cats/kai.png', Rarity.common),
    assetObjectCreator(
        'Keria', 'assets/images/cats/keria.png', Rarity.uncommon),
    assetObjectCreator(
        'Kingen', 'assets/images/cats/kingen.png', Rarity.fabled),
    assetObjectCreator('Mouse', 'assets/images/cats/mouse.png', Rarity.rare),
    assetObjectCreator(
        'Mrs. Grubsly', 'assets/images/cats/mrs_grubsly.png', Rarity.rare),
    assetObjectCreator('Nigel', 'assets/images/cats/nigel.png', Rarity.common),
    assetObjectCreator(
        'Poor Alexander', 'assets/images/cats/poor_alexander.png', Rarity.rare),
    assetObjectCreator(
        'Van Winkle', 'assets/images/cats/van_winkle.png', Rarity.unique),
    // Add more cats as needed
  ];

  static List<Asset> eyeList = [
    assetObjectCreator('Blank Eyes',
        'assets/images/backgrounds/blank_background.png', Rarity.ordinary),
    assetObjectCreator('Glasses 1',
        'assets/images/accessories/eyes/glasses_1.png', Rarity.common),
    assetObjectCreator('Monocle 1',
        'assets/images/accessories/eyes/monocle_1.png', Rarity.rare),
    assetObjectCreator('Sunglasses 1',
        'assets/images/accessories/eyes/sunglasses_1.png', Rarity.uncommon),
    // Add more eye accessories as needed
  ];

  static List<Asset> headList = [
    assetObjectCreator(
        'Blank Head', 'assets/images/backgrounds/blank_background.png', Rarity.ordinary),
    // Add more head accessories as needed
  ];

  static List<Asset> pawList = [
    assetObjectCreator(
        'Blank Paws', 'assets/images/backgrounds/blank_background.png', Rarity.ordinary),
    assetObjectCreator(
        'Book 1', 'assets/images/accessories/paws/book_1.png', Rarity.common),
    assetObjectCreator('Drink 1', 'assets/images/accessories/paws/drink_1.png',
        Rarity.uncommon),
    assetObjectCreator(
        'Food 1', 'assets/images/accessories/paws/food_1.png', Rarity.common),
    assetObjectCreator(
        'Food 2', 'assets/images/accessories/paws/food_2.png', Rarity.rare),
    // Add more paw accessories as needed
  ];

  static List<Asset> vibeList = [
    assetObjectCreator(
        'Blank Vibe', 'assets/images/backgrounds/blank_background.png', Rarity.ordinary),
    assetObjectCreator('Leaves 1',
        'assets/images/accessories/vibes/leaves_1.png', Rarity.uncommon),
    assetObjectCreator(
        'Rain 1', 'assets/images/accessories/vibes/rain_1.png', Rarity.rare),
    assetObjectCreator('Rainbow 1',
        'assets/images/accessories/vibes/rainbow_1.png', Rarity.fabled),
    assetObjectCreator('Sparkles 1',
        'assets/images/accessories/vibes/sparkles_1.png', Rarity.unique),
    // Add more vibes as needed
  ];
}
