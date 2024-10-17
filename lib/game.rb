class MHGame
  def initialize
    @doors = Array.new(3, false)
    @win_door = rand(3)
    @doors[@win_door] = true
  end

  def play(change_choice)
    choice = rand(3)

    rest_doors = (0..2).to_a - [choice]
    opened = rest_doors.shuffle.find {|el| !@doors[el] }

    if change_choice
      choice = (rest_doors - [opened]).first
    end

    return @doors[choice]
  end
end