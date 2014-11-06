require 'actor'

class Hero < Actor
  def update(game, scene, elapsed)
    move(game, scene) if scene.new_turn?
    scene.lose(game) if @health <= 0
  end

  def movement(game, scene)
    move_x = move_y = 0

    move_x += 1 if game.input.right?
    move_x -= 1 if game.input.left?
    move_y += 1 if game.input.down?
    move_y -= 1 if game.input.up?

    [move_x, move_y]
  end

  def max_health
    10
  end

  def attack_range
    (1..3)
  end

  def good?
    true
  end

  def color
    @color ||= Color[150, 50, 50]
  end
end
