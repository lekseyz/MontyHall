class Player
  attr_reader :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def first_guess
    rand(3)
  end

  def second_guess(prev_guess, other_door)
    if @strategy == :stay
      prev_guess
    elsif @strategy == :switch
      other_door
    else
      raise "Invalid strategy #{@strategy}"
    end
  end
end