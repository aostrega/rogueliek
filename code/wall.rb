require 'thing'

class Wall < Thing
  COLOR = Color[40, 40, 60]

  def draw(display)
    display.fill_color = COLOR
    display.fill_rectangle(@x * 64, @y * 64, 64, 64)
  end
end
