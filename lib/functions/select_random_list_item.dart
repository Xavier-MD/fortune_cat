import 'dart:math';

T selectRandomListItem<T>(List<T> list, Random random) {
  int randomNumber = random.nextInt(list.length);
  return list[randomNumber];
}
