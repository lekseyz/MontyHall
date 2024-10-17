require 'rspec'
require_relative '../lib/game'
require_relative '../lib/player/base_player'
require_relative '../lib/player/stay_player'
require_relative '../lib/player/switch_player'

RSpec.describe Game do
  context 'with "stay" strategy' do
    describe '#play' do
      it 'should have 1/3 win chance with 3 doors' do
        wins = 0
        simulations = 10_000

        simulations.times do
          player = StayPlayer.new(3) # player staying it's choice
          game = Game.new(player, 3)
          wins += 1 if game.play
        end

        expect(wins).to be_within(100).of(simulations / 3.0)
      end

      it 'should have 1/100 win chance with 100 doors' do
        wins = 0
        simulations = 10_000

        simulations.times do
          player = StayPlayer.new(100)
          game = Game.new(player, 100)
          wins += 1 if game.play
        end

        expect(wins).to be_within(100).of((simulations) / 100.0)
      end
    end
  end

  context 'with "switch" strategy' do
    describe '#play' do
      it 'should have 2/3 win chance with 3 doors' do
        wins = 0
        simulations = 10_000

        simulations.times do
          player = SwitchPlayer.new(3) # player changes it's choice
          game = Game.new(player, 3)
          wins += 1 if game.play
        end

        expect(wins).to be_within(100).of((2 * simulations) / 3.0)
      end

      it 'should have 99/100 win chance with 100 doors' do
        wins = 0
        simulations = 10_000

        simulations.times do
          player = SwitchPlayer.new(100)
          game = Game.new(player, 100)
          wins += 1 if game.play
        end

        expect(wins).to be_within(100).of((99 * simulations) / 100.0)
      end
    end
  end

  context 'with no strategy' do
    describe '#play' do
      it 'should throw error with no strategy' do
        player = BasePlayer.new(3)
        game = Game.new(player, 3)
        expect {
          game.play
        }.to raise_error(RuntimeError)
      end
    end
  end

end