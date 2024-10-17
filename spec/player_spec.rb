require 'rspec'
require_relative '../lib/player'

RSpec.describe Player do
  describe "#first_guess" do
    it "should return guess between 0 and 2 for :stay" do
      player = Player.new(:stay)
      guess = player.first_guess

      expect(guess).to be_between(0, 2)
    end

    it "should return guess between 0 and 2 for :switch" do
      player = Player.new(:switch)
      guess = player.first_guess

      expect(guess).to be_between(0, 2)
    end

    it "should return guess between 0 and 2 for unknown strategy" do
      player = Player.new(:any_other_symbol)
      guess = player.first_guess

      expect(guess).to be_between(0, 2)
    end
  end

  describe "#second_guess" do
    it "should return same guess for :stay" do
      player = Player.new(:stay)
      guess = player.first_guess
      second_guess = player.second_guess(guess, ((0..2).to_a - [guess]).sample)

      expect(second_guess).to eq(guess)
    end

    it "should return other guess for :switch" do
      player = Player.new(:switch)
      guess = player.first_guess
      second_guess = player.second_guess(guess, ((0..2).to_a - [guess]).sample)

      expect(second_guess).not_to eq(guess)
    end

    it "it should throw exception for unknown strategy" do
      player = Player.new(:any_other_symbol)
      guess = player.first_guess
      expect {
        second_guess = player.second_guess(guess, ((0..2).to_a - [guess]).sample)
      }.to raise_error(RuntimeError)
    end
  end
end