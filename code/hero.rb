require 'actor'

class Hero < Actor
  COLOR = Color[150, 50, 50]

  def update(game, scene, elapsed)
    move(game, scene) if scene.new_turn?
  end

  def movement(game, scene)
    move_x = move_y = 0

    move_x += 1 if game.input.right?
    move_x -= 1 if game.input.left?
    move_y += 1 if game.input.down?
    move_y -= 1 if game.input.up?

    [move_x, move_y]
  end

  def draw(display)
    display.fill_color = COLOR
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32, 24, 24)
  end

  def good?
    true
  end
end
