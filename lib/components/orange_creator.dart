import 'dart:math';

import 'package:flame/components.dart';
import 'package:pig_in_oranges/components/orange_component.dart';

class OrangeCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final _halfWidth = OrangeComponent.initialSize.x / 2;

  OrangeCreator() : super(period: 2, repeat: true);

  @override
  void onTick() {
    gameRef.addAll(
      List.generate(
        1,
        (index) => OrangeComponent(
          position: Vector2(
            _halfWidth + (gameRef.size.x - _halfWidth) * random.nextDouble(),
            1,
          ),
        ),
      ),
    );
  }
}
