import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird_flutter/components/background.dart';
import 'package:flappybird_flutter/components/bird.dart';
import 'package:flappybird_flutter/components/pipe_group.dart';
import 'package:flappybird_flutter/game/configuation.dart';
import 'package:flappybird_flutter/game/ground.dart';
import 'package:flutter/painting.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection  {
  FlappyBirdGame();

  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  void onTap() {
    super.onTap();
    bird.fly();
  }

  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = "Score: ${bird.score}";
  }

  TextComponent buildScore() {
    return TextComponent(
      text: "score: 0",
      position: Vector2(size.x / 2, size.y /2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 40, 
          fontWeight: FontWeight.bold,
          fontFamily: "Game", 
        )
      )
    );
  }
}