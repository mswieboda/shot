package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite {
  static inline var H_SPEED: Int = 250;
  static inline var V_SPEED: Int = 150;
  static inline var H_DRAG: Int = 1000;
  static inline var V_DRAG: Int = 300;

  public function new(x:Float = 0, y:Float = 0) {
    super(x, y);

    makeGraphic(32, 32, FlxColor.LIME);

    drag.x = H_DRAG;
    drag.y = V_DRAG;
  }

  override function update(elapsed: Float) {
    updateMovement();
    super.update(elapsed);
  }

  function updateMovement() {
    var up: Bool = false;
    var down: Bool = false;
    var left: Bool = false;
    var right: Bool = false;

    up = FlxG.keys.anyPressed([UP, W]);
    down = FlxG.keys.anyPressed([DOWN, S]);
    left = FlxG.keys.anyPressed([LEFT, A]);
    right = FlxG.keys.anyPressed([RIGHT, D]);

    // cancel out same directions
    if (up && down) up = down = false;
    if (left && right) left = right = false;

    // exit if no direction
    if (!up && !down && !left && !right) return;

    if (up || down) {
      velocity.y = down ? V_SPEED : -V_SPEED;
    }

    if (left || right) {
      velocity.x = right ? H_SPEED : -H_SPEED;
    }
  }
}
