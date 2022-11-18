import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:pig_in_oranges/components/enemy_creator.dart';
import 'package:pig_in_oranges/components/orange_creator.dart';
import 'package:pig_in_oranges/components/player_component.dart';
import 'package:pig_in_oranges/components/star_background_creator.dart';

class PigInOrangesGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  static const String description = '''
    A simple game in Flame.
  ''';

  late final PlayerComponent player;
  late final TextComponent componentCounter;
  late final TextComponent scoreText;
  late final TextComponent healthText;

  int score = 0;
  int health = 8;

  @override
  Future<void> onLoad() async {
    add(ParallaxComponentCreator());
    add(player = PlayerComponent());
    addAll([
      FpsTextComponent(
        position: size - Vector2(0, 75),
        anchor: Anchor.bottomRight,
      ),
      scoreText = TextComponent(
        position: size - Vector2(0, 50),
        anchor: Anchor.bottomRight,
        priority: 1,
      ),
      healthText = TextComponent(
        position: size - Vector2(0, 25),
        anchor: Anchor.bottomRight,
        priority: 1,
      ),
      componentCounter = TextComponent(
        position: size,
        anchor: Anchor.bottomRight,
        priority: 1,
      ),
    ]);

    add(OrangeCreator());
    add(EnemyCreator());
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = 'Score: $score';
    healthText.text = 'Health: $health';
    componentCounter.text = 'Components: ${children.length}';
  }


  @override
  void onPanUpdate(DragUpdateInfo details) {
    player.position += details.delta.game;
  }

  void increaseScore() {
    score++;
  }

  void decreaseHealth() {
    health--;
  }
}
