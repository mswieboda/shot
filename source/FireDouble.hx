package;

import flixel.math.FlxPoint;

class FireDouble extends FireType {
  public function new(player: Player) {
    super(player);
  }

  public override function fire() {
    var velocity = new FlxPoint(0, -300);
    var bulletLeft = new Bullet(
      player.x + player.width / 4,
      player.y,
      velocity
    );
    var bulletRight = new Bullet(
      player.x + player.width / 2 + player.width / 4,
      player.y,
      velocity
    );

    player.bullets.add(bulletLeft);
    player.bullets.add(bulletRight);
  }
}
