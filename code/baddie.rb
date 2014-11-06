require 'actor'

class Baddie < Actor
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

  def max_health
    12
  end

  def attack_range
    (1..4)
  end

  def color
    @color ||= Color[50, 150, 50]
  end
end
