package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class Enemy extends Ship {
  public function new(
    ?x: Float = 0,
    ?y: Float = 0,
    ?asset: String = AssetPaths.player__png,
    ?color: FlxColor = 0xff00ff,
    ?width: Int = 32,
    ?height: Int = 32,
    ?animated: Bool = false,
    ?angle: Float = 180
  ) {
    super(x, y, asset, color, width, height, animated, angle);
  }

  static public function collide(enemy: Dynamic, bullet: Dynamic) {
    enemy.hit(bullet);
  }

  function hit(bullet: Bullet) {
    hurt(bullet.damage);
    bullet.kill();
  }
}
