import 'package:flame/components.dart';

class EatOrangeComponent extends SpriteAnimationComponent with HasGameRef {
  EatOrangeComponent({super.position})
      : super(
          size: Vector2.all(50),
          anchor: Anchor.center,
          removeOnFinish: true,
        );
}
