require 'thing'

class Player < Thing
  COLOR = Color[150, 50, 50]

  def update(game, scene, elapsed)
    move_x = move_y = 0

    move_x += 1 if game.keyboard.pressed? :right
    move_x -= 1 if game.keyboard.pressed? :left
    move_y += 1 if game.keyboard.pressed? :down
    move_y -= 1 if game.keyboard.pressed? :up

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

  def draw(display)
    display.fill_color = COLOR
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32, 24, 24)
  end
end
