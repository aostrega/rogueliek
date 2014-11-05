require 'thing'

class Boulder < Thing
  COLOR = Color[160, 160, 160]

  def draw(display)
    display.fill_color = COLOR
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32, 24, 24)
  end

  def pushable?
    true
  end
end
