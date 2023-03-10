require 'rspec'
require_relative '../classes/title'
require_relative '../classes/games/game'

describe Game do
  game = Game.new(true, Time.new(2010, 9, 1), Time.new(1990, 12, 29), true)

  describe '#initialize' do
    it 'should create a new Game' do
      expect(game).to be_a Game
    end

    it 'the new Game\'s publish date should be 1990-12-29' do
      expected_time = Time.new(1990, 12, 29)

      expect(game.publish_date).to eq(expected_time)
    end

    it 'the new Game\'s last_played_at should be 2010-09-01' do
      expected_time = Time.new(2010, 9, 1)

      expect(game.last_played_at).to eq(expected_time)
    end
  end

  describe '#can_be_archived?' do
    it 'shoud return true if archived variable is true and last played was at least 2 years ago' do
      game = Game.new(true, '2010-09-01', '1990-12-29', true)

      expect(game.can_be_archived?).to eq(true)
    end

    it 'shoud return nothing if published date is less that 10 years ago' do
      game = Game.new(true, '2010-09-01', '2020-3-23', true)

      expect(game.can_be_archived?).to eq(nil)
    end

    it 'shoud return true if published date is greater that 10 years ago and last played was at least 2 years ago' do
      game = Game.new(true, '2010-09-01', '2005-3-23', true)

      expect(game.can_be_archived?).to eq(true)
    end

    it 'shoud return nothing if last_played_at variable was less than 2 years ago' do
      game = Game.new(true, '2022-1-1', '1990-12-29', true)

      expect(game.can_be_archived?).to eq(nil)
    end
  end
end
