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

  def column?(player)
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

  def row?(player)
    count = 0

    board.each do |row|
      row.each do |column|
        if count > 0 && column.empty?
          return false
        end

        if column.any?(player)
          count += 1
        end

        return true if count >= 4
      end

      count = 0
    end

    return false
  end

  def diagonal?(player)
  end

  def recursive_diagonal(player, position = [0, 0], count = 0)
    return if count > 0 && position.empty?
    return if count >= 4

    row, column = position

    if board[row][column].any?(player)
      count += 1
      recursive_diagonal(player, [row + 1, column + 1], count)
      recursive_diagonal(player, [row + 1, column - 1], count)
    end

    if board[row][column].empty?
      recursive_diagonal(player, [row, column + 1], count = 0)
    end


end
