package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class Ship extends FlxSprite {
  static inline var H_SPEED: Int = 250;
  static inline var V_SPEED: Int = 150;
  static inline var H_DRAG: Int = 1000;
  static inline var V_DRAG: Int = 300;

  public function new(
    ?x: Float = 0,
    ?y: Float = 0,
    ?asset: String = "",
    ?color: FlxColor = 0x000000,
    ?width: Int = 32,
    ?height: Int = 32,
    ?animated: Bool = false,
    ?angle: Float = 0
  ) {
    super(x, y);

    loadGraphic(asset, animated, width, height);

    this.angle = angle;
    this.color = color;

    // don't move from collisions
    this.immovable = true;

    drag.x = H_DRAG;
    drag.y = V_DRAG;
  }

  public function hSpeed() {
    return H_SPEED;
  }

  public function vSpeed() {
    return V_SPEED;
  }

  public function hDrag() {
    return H_DRAG;
  }

  public function vDrag() {
    return V_DRAG;
  }
}
