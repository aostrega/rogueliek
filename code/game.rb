require 'scene'

class TilesAplenty < Game
  def setup
    display.size = 640, 640
    @scene = Scene.new
  end

  def update(elapsed)
    @scene.update(self, elapsed)
    @scene.draw(display)

    display.fill_color = Color[255, 255, 255]
    display.fill_text(ticker.ticks_per_second, display.width - 32, 32)
  end
end
