import 'package:flutter/material.dart';
import 'package:guessing_game/utils/game_logic.dart';
import 'package:guessing_game/widgets/score_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Game _game = Game();
  int tries = 0;
  int score = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF3D4564),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            "Memory Game",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreBoard("Tentativas", "$tries"),
              scoreBoard("Score", "$score"),
            ],
          ),
          SizedBox(
              height: screenWidth,
              width: screenWidth,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0),
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print(_game.card_list[index]);
                        setState(() {
                          tries++;
                          _game.gameImg![index] = _game.card_list[index];
                          _game.matchCheck!
                              .add({index: _game.card_list[index]});
                        });
                        print("tentativas:");
                        print(tries);
                        if (_game.matchCheck!.length == 2) {
                          if (_game.matchCheck![0].values.first ==
                              _game.matchCheck![1].values.first) {
                            score += 10;
                            _game.matchCheck!.clear();
                          } else {
                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                _game.gameImg![_game.matchCheck![0].keys
                                    .first] = _game.hiddenCardPath;
                                _game.gameImg![_game.matchCheck![1].keys
                                    .first] = _game.hiddenCardPath;
                                _game.matchCheck!.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                },
                itemCount: _game.gameImg!.length ?? 0,
              ))
        ],
      ),
    );
  }
}
