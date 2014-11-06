require 'input'
require 'scene'

class Rogueliek < Game
  attr_reader :input

  def setup
    display.size = 640, 640
    @input = Input.new
    @scene = Scene.new
  end

  def update(elapsed)
    @input.up if keyboard.pressed? :up
    @input.down if keyboard.pressed? :down
    @input.left if keyboard.pressed? :left
    @input.right if keyboard.pressed? :right

    @scene.update(self, elapsed)
    @scene.draw(display)

    display.fill_color = Color[255, 255, 255]
    display.fill_text(ticker.ticks_per_second, display.width - 32, 32)

    @input.reset
  end
end
