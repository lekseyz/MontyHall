require 'player'
class MHGame
  def initialize(player)
    @doors = Array.new(3, false)
    @win_door = rand(3)
    @doors[@win_door] = true
    @player = player
  end

  def play
    guess = @player.first_guess
    except_guess = (0..2).to_a - [guess]

    other_variant = guess == @win_door ? except_guess.sample : @win_door

    guess = @player.second_guess(guess, other_variant)

    @doors[guess]
  end
end