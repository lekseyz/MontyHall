require_relative './player/base_player'
class Game
  def initialize(player, doors_count) # uses basic player class to achieve D principle of SOLID principles
    @doors = Array.new(doors_count, false) # expends task by adding more doors
    @win_door = rand(doors_count)
    @doors[@win_door] = true
    @player = player
  end

  def play
    guess = @player.first_guess
    except_guess = (0..@doors.size).to_a - [guess]

    other_variant = guess == @win_door ? except_guess.sample : @win_door

    guess = @player.second_guess(other_variant) # second guess depends of BasePlayer implementation

    @doors[guess]
  end
end