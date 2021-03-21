package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Bullet extends FlxSprite {
  static inline var V_DRAG: Int = 0;

  public function new(x: Float = 0, y: Float = 0, velocity: FlxPoint) {
    super(x, y);

    loadGraphic(AssetPaths.bullet__png, true, 8, 16);

    color = 0x00ff00;

    this.x -= width / 2;
    drag.y = V_DRAG;
    this.velocity = velocity;
  }

  override function update(elapsed: Float) {
    updateKill();
    super.update(elapsed);
  }

  function updateKill() {
    if (!inWorldBounds()) {
      kill();
    }
  }
}
