require 'thing'

class Actor < Thing
  def movement(scene)
    [0, 0]
  end

  def move(game, scene)
    move_x, move_y = movement(game, scene)

    return if move_x.zero? && move_y.zero?

    collidee = scene.find_collision(self, @x + move_x, @y + move_y)

    if collidee.nil?
      self.x += move_x
      self.y += move_y
    else
      collidee_collidee =
        scene.find_collision(collidee, collidee.x + move_x, collidee.y + move_y)

      if collidee.pushable? && collidee_collidee.nil?
        collidee.x += move_x
        collidee.y += move_y
        self.x += move_x
        self.y += move_y
      end
    end
  end
end
