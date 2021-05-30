import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

void main() async {
  final game = BoxGame();
  runApp(GameWidget(game: game));
}

class BoxGame extends Game {
  static const int squareSpeed = 400;
  static final squarePaint = BasicPalette.white.paint();
  late Rect squarePos;
  int squareDirection = 1;
  int vSquareDirection = 1;

  @override
  Future<void> onLoad() async {
    squarePos = Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(squarePos, squarePaint);
  }

  void update(double dt) {
    squarePos = squarePos.translate(squareSpeed * squareDirection * dt,
        squareSpeed * vSquareDirection * dt);

    if (squareDirection == 1 && squarePos.right > size.x) {
      squareDirection = -1;
    } else if (squareDirection == -1 && squarePos.left < 0) {
      squareDirection = 1;
    }

    if (vSquareDirection == 1 && squarePos.bottom > size.y) {
      vSquareDirection = -1;
    } else if (vSquareDirection == -1 && squarePos.top < 0) {
      vSquareDirection = 1;
    }
  }
}
