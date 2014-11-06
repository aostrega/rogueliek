class Input
  def initialize
    reset
  end

  def reset
    @input = {}
  end

  def any?
    @input.values.include? true
  end

  def up
    @input[:up] = true
  end

  def up?
    @input[:up] == true
  end

  def down
    @input[:down] = true
  end

  def down?
    @input[:down] == true
  end

  def left
    @input[:left] = true
  end

  def left?
    @input[:left] == true
  end

  def right
    @input[:right] = true
  end

  def right?
    @input[:right] == true
  end
end
