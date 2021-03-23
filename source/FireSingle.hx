package;

import flixel.math.FlxPoint;

class FireSingle extends FireType {
  public function new(player: Player) {
    super(player);
  }

  public override function fire() {
    var bullet = new Bullet(
      player.x + player.width / 2,
      player.y,
      new FlxPoint(0, -300)
    );

    player.bullets.add(bullet);
  }
}
