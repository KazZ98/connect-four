# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    board = []

    6.times do
      row = []

      7.times do
        column = []
        row << column
      end

      board << row
    end

    board
  end

  def update_board(player, position)
    row, column = position
    @board[row][column] << player
  end

  def four?(player)
    count = 0

    7.times do |column|
      board.each do |row|
        return true if count >= 4
        return false if row[column].empty? && count >= 1

        if row[column].any?(player)
          count += 1
        end
      end
    end
  end
end
