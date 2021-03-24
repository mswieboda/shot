package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class Player extends Ship {
  static inline var INTIAL_FIRE_DELAY: Float = 0.1;

  public var bullets: FlxTypedGroup<Bullet> = new FlxTypedGroup<Bullet>();

  var fireDelay: Float = INTIAL_FIRE_DELAY;
  var fireDelayElapsed: Float = INTIAL_FIRE_DELAY;
  var fireType: FireType = new FireSingle(null);

  public function new(
    ?x: Float = 0,
    ?y: Float = 0,
    ?asset: String = AssetPaths.player__png,
    ?color: FlxColor = 0x00ff00,
    ?width: Int = 32,
    ?height: Int = 32,
    ?animated: Bool = false,
    ?angle: Float = 0
  ) {
    super(x, y, asset, color, width, height, animated, angle);

    fireType = new FireSingle(this);
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
      velocity.y = down ? vSpeed() : -vSpeed();
    }

    if (left || right) {
      velocity.x = right ? hSpeed() : -hSpeed();
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
