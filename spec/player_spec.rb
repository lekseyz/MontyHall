require 'rspec'
require_relative '../lib/player/base_player'
require_relative '../lib/player/stay_player'
require_relative '../lib/player/switch_player'

RSpec.describe SwitchPlayer do
  describe "#first_guess" do
    it "should return guess between 0 and n for switch strategy" do
      n = rand(100)
      player = SwitchPlayer.new(n)
      guess = player.first_guess

      expect(guess).to be_between(0, n)
    end
  end

  describe "#second_guess" do
    it "should return other guess for switch strategy" do
      n = rand(100)
      player = SwitchPlayer.new(n)
      guess = player.first_guess
      second_guess = player.second_guess(((0..n).to_a - [guess]).sample)

      expect(second_guess).not_to eq(guess)
    end
  end
end

RSpec.describe StayPlayer do
  describe "#first_guess" do
    it "should return guess between 0 and n for stay strategy" do
      n = rand(100)
      player = StayPlayer.new(n)
      guess = player.first_guess

      expect(guess).to be_between(0, n)
    end
  end

  describe "#second_guess" do
    it "should return same guess for stay strategy" do
      n = rand(100)
      player = StayPlayer.new(n)
      guess = player.first_guess
      second_guess = player.second_guess(((0..n).to_a - [guess]).sample)

      expect(second_guess).to eq(guess)
    end
  end
end