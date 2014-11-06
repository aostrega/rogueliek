require 'thing'

class Actor < Thing
  DEATH_COLOR = Color[222, 222, 222]

  attr_accessor :health

  def initialize(x, y)
    super

    @health = max_health
  end

  def movement(scene)
    [0, 0]
  end

  def update(game, space, elapsed)
    game.lose if @health <= 0
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

      if collidee.respond_to? :health
        collidee.health -= rand(attack_range.last) + attack_range.first
        collidee.health = 0 if collidee.health < 0
      elsif collidee.pushable? && collidee_collidee.nil?
        collidee.x += move_x
        collidee.y += move_y
        self.x += move_x
        self.y += move_y
      end
    end
  end

  def draw(display)
    display.fill_color = DEATH_COLOR
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32, 23, 23)

    health_percent = @health / max_health
    display.fill_color = color
    display.fill_ellipse(@x * 64 + 32, @y * 64 + 32,
                         24 * health_percent, 24 * health_percent)
  end

  def max_health
    1
  end

  def attack_range
    (0..1)
  end

  def color
    @color ||= Color[0, 0, 0]
  end
end
