require 'rspec'
require_relative '../lib/game'
require_relative '../lib/player'

RSpec.describe MHGame do
  describe '#play' do
    it 'should have 1/3 win chance' do
      wins = 0
      simulations = 10_000

      simulations.times do
        player = Player.new(:stay) # игрок не меняет выбор
        game = MHGame.new(player)
        wins += 1 if game.play
      end

      expect(wins).to be_within(100).of(simulations / 3.0)
    end

    it 'should have 2/3 win chance' do
      wins = 0
      simulations = 10_000

      simulations.times do
        player = Player.new(:switch) # игрок меняет выбор
        game = MHGame.new(player)
        wins += 1 if game.play
      end

      expect(wins).to be_within(100).of((2 * simulations) / 3.0)
    end
  end
end