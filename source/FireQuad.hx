package;

import flixel.math.FlxPoint;

class FireQuad extends FireDouble {
  public function new(player: Player) {
    super(player);
  }

  public override function fire() {
    super.fire();

    var velocity = new FlxPoint(0, -300);
    var bulletLeft = new Bullet(
      player.x,
      player.y,
      velocity
    );
    var bulletRight = new Bullet(
      player.x + player.width,
      player.y,
      velocity
    );

    player.bullets.add(bulletLeft);
    player.bullets.add(bulletRight);
  }
}
