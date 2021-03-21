package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Bullet extends FlxSprite {
  static inline var V_DRAG: Int = 10;

  public function new(x: Float = 0, y: Float = 0, velocity: FlxPoint) {
    super(x, y);

    makeGraphic(4, 8, FlxColor.LIME);

    drag.y = V_DRAG;
    this.velocity = velocity;
  }
}
