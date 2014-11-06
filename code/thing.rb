class Thing
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def update(game, scene, elapsed)
  end

  def draw(display)
  end

  def pushable?
    false
  end
end
