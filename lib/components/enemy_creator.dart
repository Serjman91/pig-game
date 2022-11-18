import 'dart:math';

import 'package:flame/components.dart';
import 'package:pig_in_oranges/components/enemy_component.dart';

class EnemyCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final _halfWidth = EnemyComponent.initialSize.x / 2;

  EnemyCreator() : super(period: 1.5, repeat: true);

  @override
  void onTick() {
    gameRef.addAll(
      List.generate(
        1,
        (index) => EnemyComponent(
          position: Vector2(
            _halfWidth + (gameRef.size.x - _halfWidth) * random.nextDouble(),
            1,
          ),
        ),
      ),
    );
  }
}
