import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:pig_in_oranges/components/eat_orange_component.dart';
import 'package:pig_in_oranges/pig_in_oranges_game.dart';

class OrangeComponent extends SpriteAnimationComponent
    with HasGameRef<PigInOrangesGame>, CollisionCallbacks {
  static const speed = 120;
  static Vector2 initialSize = Vector2.all(40);

  OrangeComponent({required super.position})
      : super(size: initialSize, anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'orange-sprite.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 4,
        textureSize: Vector2.all(40),
      ),
    );
    add(RectangleHitbox(priority: 1)..collisionType = CollisionType.passive);
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += speed * dt;
    if (y >= gameRef.size.y) {
      removeFromParent();
    }
  }

  void takeOrange() {
    removeFromParent();

    gameRef.add(EatOrangeComponent(position: position));
    gameRef.increaseScore();
  }
}

