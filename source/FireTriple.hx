package;

import flixel.math.FlxPoint;

class FireTriple extends FireSingle {
  public function new(player: Player) {
    super(player);
  }

  public override function fire() {
    super.fire();

    var speed_x = 10;
    var speed = 300;
    var speed_y = Math.sqrt(Math.pow(speed, 2) - Math.pow(speed_x, 2));

    var bulletLeft = new Bullet(
      player.x + player.width / 4,
      player.y,
      new FlxPoint(-speed_x, -speed_y)
    );
    var bulletRight = new Bullet(
      player.x + player.width / 2 + player.width / 4,
      player.y,
      new FlxPoint(speed_x, -speed_y)
    );

    player.bullets.add(bulletLeft);
    player.bullets.add(bulletRight);
  }
}
