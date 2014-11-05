require 'wall'
require 'player'
require 'boulder'

class Scene
  COLOR = Color[50, 50, 50]

  def initialize
    @width, @height = 640, 640
    @things = []
    10.times do |n|
      @things << Wall.new(0, n)
      @things << Wall.new(9, n)
      @things << Wall.new(n, 0)
      @things << Wall.new(n, 9)
    end
    @things << Player.new(5, 5)
    @things << Boulder.new(7, 6)
  end

  def update(game, elapsed)
    @things.each { |t| t.update(game, self, elapsed) }
  end

  def draw(display)
    display.fill_color = COLOR
    display.clear

    @things.each { |t| t.draw(display) }
  end

  def find_collision(t, x, y)
    @things.find do |thing|
      next if thing == t

      thing.x == x && thing.y == y
    end
  end
end
