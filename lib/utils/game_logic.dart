class Game {
  final String hiddenCardPath = "assets/interrogation.png";
  List<String>? gameImg;
  final int cardCount = 8;

  final List<String> card_list = [
    "assets/circle.png",
    "assets/heart.png",
    "assets/star.png",
    "assets/triangle.png",
    "assets/heart.png",
    "assets/circle.png",
    "assets/triangle.png",
    "assets/star.png",
  ];

  List<Map<int, String>>? matchCheck = [];

  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}
