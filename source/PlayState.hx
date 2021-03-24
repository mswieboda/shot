package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.util.FlxAxes;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState {
  var player: Player;
  var enemies: FlxTypedGroup<Enemy> = new FlxTypedGroup<Enemy>();

  override public function create() {
    player = new Player();

    // center player X, position at bottom of screen
    player.screenCenter(FlxAxes.X);
    player.y = FlxG.height - player.height * 2;

    // enemies
    var enemies = [
      new Enemy(100, 100, 0xff0000),
      new Enemy(300, 100, 0x0000ff),
      new Enemy(500, 100, 0x00ffff)
    ];

    for (enemy in enemies) {
      this.enemies.add(enemy);
    }

    // specific drawing layered order
    add(this.enemies);
    add(player);
    add(player.bullets);

    super.create();
  }

  override function update(elapsed: Float) {
    checkCollisions();

    super.update(elapsed);
  }

  function checkCollisions() {
    FlxG.overlap(enemies, player.bullets, Enemy.collide, FlxObject.updateTouchingFlags);
  }
}
