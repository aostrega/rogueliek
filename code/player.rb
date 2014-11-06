require 'thing'

class Player < Thing
  COLOR = Color[150, 50, 50]

  def update(game, scene, elapsed)
    velocity_x = velocity_y = 0

    velocity_x += 1 if game.keyboard.pressed? :right
    velocity_x -= 1 if game.keyboard.pressed? :left
    velocity_y += 1 if game.keyboard.pressed? :down
    velocity_y -= 1 if game.keyboard.pressed? :up

    move(scene, velocity_x, velocity_y)
  end

  def draw(display)
    display.fill_color = COLOR
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32, 24, 24)
  end
end
