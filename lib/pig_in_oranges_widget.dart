import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:pig_in_oranges/pig_in_oranges_game.dart';

class PigInOrangesWidget extends StatelessWidget {
  const PigInOrangesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: PigInOrangesGame(),
      loadingBuilder: (_) => const Center(
        child: Text('Loading'),
      ),
    );
  }
}
