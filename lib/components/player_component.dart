import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:pig_in_oranges/components/bullet_component.dart';
import 'package:pig_in_oranges/components/eat_orange_component.dart';
import 'package:pig_in_oranges/components/enemy_component.dart';
import 'package:pig_in_oranges/components/explosion_component.dart';
import 'package:pig_in_oranges/components/orange_component.dart';

class PlayerComponent extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  // late TimerComponent bulletCreator;

  PlayerComponent()
      : super(
          size: Vector2(50, 75),
          position: Vector2(100, 500),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    add(CircleHitbox());

    animation = await gameRef.loadSpriteAnimation(
      'spritesheet.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 4,
        textureSize: Vector2(32, 39),
      ),
    );
  }

  final _bulletAngles = [0.5, 0.3, 0.0, -0.5, -0.3];
  void _createBullet() {
    gameRef.addAll(
      _bulletAngles.map(
        (angle) => BulletComponent(
          position: position + Vector2(0, -size.y / 2),
          angle: angle,
        ),
      ),
    );
  }

  void takeHit() {
    gameRef.add(ExplosionComponent(position: position));
  }

  void takeOrange() {
    gameRef.add(EatOrangeComponent(position: position));
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is EnemyComponent) {
      other.takeHit();
    }
    if (other is OrangeComponent) {
      other.takeOrange();
    }
  }
}
