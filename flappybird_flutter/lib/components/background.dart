import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/flappy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}