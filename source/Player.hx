package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class Player extends FlxSprite {
  static inline var H_SPEED: Int = 250;
  static inline var V_SPEED: Int = 150;
  static inline var H_DRAG: Int = 1000;
  static inline var V_DRAG: Int = 300;
  static inline var INTIAL_FIRE_DELAY: Float = 0.1;

  public var bullets: FlxTypedGroup<Bullet> = new FlxTypedGroup<Bullet>();

  var fireDelay: Float = INTIAL_FIRE_DELAY;
  var fireDelayElapsed: Float = INTIAL_FIRE_DELAY;
  var fireType: FireType = new FireSingle(null);

  public function new(x: Float = 0, y: Float = 0) {
    super(x, y);

    fireType = new FireSingle(this);

    loadGraphic(AssetPaths.player__png, true, 32, 32);

    color = 0x00ff00;

    drag.x = H_DRAG;
    drag.y = V_DRAG;
  }

  override function update(elapsed: Float) {
    updateMovement();
    updateFire(elapsed);

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

  function updateFire(elapsed: Float) {
    var firing: Bool = FlxG.keys.anyPressed([SPACE, SHIFT]);

    fireDelayElapsed += elapsed;

    bullets.forEachDead(function (bullet) {
      bullets.remove(bullet, true);
    });

    fireTypeSwitcher();

    if (!firing) return;
    if (fireDelayElapsed <= fireDelay) return;

    fireDelayElapsed = 0;

    fireType.fire();
  }

  function fireTypeSwitcher() {
    // NOTE: temp to test different fire types
    if (FlxG.keys.justPressed.ONE) {
      fireType = new FireSingle(this);
    } else if (FlxG.keys.justPressed.TWO) {
      fireType = new FireDouble(this);
    } else if (FlxG.keys.justPressed.THREE) {
      fireType = new FireTriple(this);
    } else if (FlxG.keys.justPressed.FOUR) {
      fireType = new FireQuad(this);
    }
  }
}
