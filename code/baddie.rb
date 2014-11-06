require 'actor'

class Baddie < Actor
  COLOR = Color[50, 150, 50]

  def update(game, scene, elapsed)
    move(game, scene) if scene.new_turn?
  end

  def movement(game, scene)
    target = scene.things.find(&:good?)

    return [0, 0] if target.nil?

    move_x = move_y = 0

    move_x += 1 if target.x > x
    move_x -= 1 if target.x < x
    move_y += 1 if target.y > y
    move_y -= 1 if target.y < y

    [move_x, move_y]
  end

  def draw(display)
    display.fill_color = COLOR
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32, 24, 24)
  end
end
