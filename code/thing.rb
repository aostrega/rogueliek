class Thing
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def update(game, scene, elapsed)
  end

  def draw(display)
  end

  # Attempt to move.
  # @return [true, false] whether moved
  def move(scene, move_x, move_y)
    return if move_x.zero? && move_y.zero?

    collidee = scene.find_collision(self, @x + move_x, @y + move_y)

    if collidee.nil?
      self.x += move_x
      self.y += move_y

      true
    else
      if collidee.pushable?
        if collidee.move(scene, move_x, move_y)
          self.x += move_x
          self.y += move_y

          true
        else
          false
        end
      else
        false
      end
    end
  end

  def pushable?
    false
  end
end
