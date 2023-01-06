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

  describe '#column?' do
    context 'when is one element in a the same index of each board array(column) 4 times' do
      subject(:game_four_column) { described_class.new }

      it 'returns true' do
        player = 'x'

        4.times do |n|
          position = [n, 0]
          game_four_column.update_board(player, position)
        end

        expect(game_four_column.column?(player)).to be_truthy
      end
    end

    context 'when is one element in a the same index of each board array(column) less than 4 times' do
      subject(:game_not_column) { described_class.new }

      it 'returns false' do
        player = 'x'
        position = [0, 0]
        game_not_column.update_board(player, position)

        expect(game_not_column.column?(player)).to be_falsy
      end
    end
  end

  describe '#row?' do
    context 'when is one element in each index of one board array(row) 4 times' do
      subject(:game_four_row) { described_class.new }

      it 'returns true' do
        player = 'x'

        4.times do |n|
          position = [1, n]
          game_four_row.update_board(player, position)
        end

        expect(game_four_row.row?(player)).to be_truthy
      end
    end

    context 'when is one element in each index of one board array(row) less than 4 times' do
      subject(:game_not_row) { described_class.new }

      it 'returns false' do
        player = 'x'
        position = [0, 0]
        #game_not_row.update_board(player, position)

        expect(game_not_row.row?(player)).to be_falsy
      end
    end
  end

  describe '#diagonal?' do
    context 'when is one element in each board array(row) in the next or previus continuous index(diagonal) 4 times' do
      subject(:game_four_diagonal) { described_class.new }

      it 'returns true' do
        player = 'x'

        4.times do |n|
          position = [n, n]
          game_four_diagonal.update_board(player, position)
        end

        expect(game_four_diagonal.diagonal?(player)).to be_truthy
      end
    end
  end
end
