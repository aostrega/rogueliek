require 'wall'
require 'boulder'
require 'hero'
require 'baddie'

class Scene
  COLOR = Color[50, 50, 50]

  attr_reader :things

  def initialize
    @width, @height = 640, 640

    @things = []

    10.times do |n|
      @things << Wall.new(0, n)
      @things << Wall.new(9, n)
      @things << Wall.new(n, 0)
      @things << Wall.new(n, 9)
    end

    [Boulder, Boulder, Boulder, Hero, Baddie].each do |thing|
      x = rand(1..8)
      y = rand(1..8)

      begin
        x = rand(1..8)
        y = rand(1..8)
      end until find_collision(nil, x, y).nil?

      @things << thing.new(x, y)
    end
  end

  def update(game, elapsed)
    @new_turn = game.input.any?

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

  def new_turn?
    @new_turn
  end
end
