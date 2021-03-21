package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxAxes;

class PlayState extends FlxState {
  var player: Player;

  override public function create() {
    player = new Player();

    // center player X, position at bottom of screen
    player.screenCenter(FlxAxes.X);
    player.y = FlxG.height - player.height * 2;

    add(player);

    super.create();
  }

  override public function update(elapsed: Float) {
    player.updatePlayState(elapsed, this);
    super.update(elapsed);
  }
}
