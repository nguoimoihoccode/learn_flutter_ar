import 'package:flame/game.dart';
import 'package:flappybird_flutter/game/flappy_bird_game.dart';
import 'package:flappybird_flutter/screens/game_over_screen.dart';
import 'package:flappybird_flutter/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'Loser, NON': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
