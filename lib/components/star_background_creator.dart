import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/rendering.dart';

class ParallaxComponentCreator extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData('track.png'),
    ],
      baseVelocity: Vector2(0, -190),
      repeat: ImageRepeat.repeatY,
      fill: LayerFill.width
    );
  }
}
