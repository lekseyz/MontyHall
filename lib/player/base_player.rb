=begin
The strategy pattern is used to comply with the dependency inversion principle and user customization of strategies
=end
class BasePlayer
  attr_reader :num_of_doors

  def initialize(num_of_doors)
    @num_of_doors = num_of_doors
  end

  def first_guess
    @guess = rand(num_of_doors)
  end

  def second_guess(other_door)
    raise 'Not Implemented'
  end
end