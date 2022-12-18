# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#create_board' do
    it 'returns an array' do
      expect(board.create_board).to be_an_instance_of(Array)
    end

    context 'array should have 6 rows and 7 columns' do
      it 'return 6 number of elements (rows)' do
        elements = board.create_board.size
        expect(elements).to eq(6)
      end

      it 'return 7 number of elements of the first element (columns)' do
        elements = board.create_board.first.size
        expect(elements).to eq(7)
      end
    end
  end

  describe '#update_board' do
    context 'when change the size of an array inside board array' do
      it 'array must have size of 1' do
        player = 'x'
        position = [5, 6]

        board.update_board(player, position)
        result = board.board.last.last.size
        expect(result).to eq(1)
      end
    end
  end

  describe '#four?' do
    context 'when is one element in a the same index of each board array(column) 4 times' do
      subject(:game_four_column) { described_class.new }

      it 'returns true' do
        player = 'x'

        4.times do |n|
          game_four_column.update_board(player, [n, 0])
        end

        expect(game_four_column.four?(player)).to be_truthy
      end
    end

    context 'when is one element in a the same index of each board array(column) less than 4 times' do
      subject(:game_one_column) { described_class.new }

      it 'returns false' do
        player = 'x'
        game_one_column.update_board(player, [0, 0])

        expect(game_one_column.four?(player)).to be_falsy
      end
    end
  end
end
