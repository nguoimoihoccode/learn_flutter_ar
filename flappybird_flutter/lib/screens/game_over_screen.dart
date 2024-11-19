import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "Loser, NON";
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _restart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text(
                "Restart",
                style: TextStyle(fontSize: 20),
              ))
          ],
        ),
      ),
    );
  }

  void _restart() {
    game.bird.reset();
    game.overlays.remove("Loser, NON");
    game.resumeEngine();
  }
}