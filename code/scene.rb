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

    [Boulder, Boulder, Boulder, Baddie, Hero].each do |thing|
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

  def draw(game)
    game.display.fill_color = COLOR
    game.display.clear

    @things.each { |t| t.draw(game.display) }

    if @lost_tick
      if game.ticker.tick_count - @lost_tick < 100
        game.display.fill_color = Color[0, 0, 0]
        game.display.clear
      else
        initialize
        @lost_tick = nil
        @won_tick = nil
      end
    elsif @won_tick
      ticks = game.ticker.tick_count - @won_tick
      hero = things.find { |t| t.is_a? Hero }
      hero.health += 2
    end
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

  def win(game)
    @won_tick ||= game.ticker.tick_count
  end

  def lose(game)
    @lost_tick ||= game.ticker.tick_count
  end
end
