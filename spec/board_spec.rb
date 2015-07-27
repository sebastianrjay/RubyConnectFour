require 'spec_helper'

describe Board do
  def create_winning_col_board
    @winning_col_board = Board.new(10, 8, 5)
    @player_A = Player.new("A")
    @player_B = Player.new("B")
    @winning_col_board.place_mark(@player_A, 6)
    @winning_col_board.place_mark(@player_B, 5)
    @winning_col_board.place_mark(@player_A, 6)
    @winning_col_board.place_mark(@player_B, 5)
    @winning_col_board.place_mark(@player_A, 6)
    @winning_col_board.place_mark(@player_B, 5)
    @winning_col_board.place_mark(@player_A, 6)
    @winning_col_board.place_mark(@player_B, 5)
    @winning_col_board.place_mark(@player_A, 6)
    puts "Winning column board:"
    @winning_col_board.render
  end

  def create_winning_row_board
    @winning_row_board = Board.new(10, 8, 5)
    @player_C = Player.new("C")
    @player_D = Player.new("D")
    @winning_row_board.place_mark(@player_C, 6)
    @winning_row_board.place_mark(@player_D, 7)
    @winning_row_board.place_mark(@player_C, 5)
    @winning_row_board.place_mark(@player_D, 7)
    @winning_row_board.place_mark(@player_C, 4)
    @winning_row_board.place_mark(@player_D, 7)
    @winning_row_board.place_mark(@player_C, 3)
    @winning_row_board.place_mark(@player_D, 7)
    @winning_row_board.place_mark(@player_C, 2)
    puts "Winning row board:"
    @winning_row_board.render
  end

  def create_non_winning_col_board
    @non_winning_col_board = Board.new(10, 8, 5)
    @player_G = Player.new("G")
    @player_H = Player.new("H")
    @non_winning_col_board.place_mark(@player_G, 6)
    @non_winning_col_board.place_mark(@player_H, 5)
    @non_winning_col_board.place_mark(@player_G, 6)
    @non_winning_col_board.place_mark(@player_H, 5)
    @non_winning_col_board.place_mark(@player_G, 6)
    @non_winning_col_board.place_mark(@player_H, 5)
    @non_winning_col_board.place_mark(@player_G, 6)
    @non_winning_col_board.place_mark(@player_H, 6)
    @non_winning_col_board.place_mark(@player_G, 6)
    puts "Non-winning full column board:"
    @non_winning_col_board.render
  end

  def create_non_winning_row_board
    @non_winning_row_board = Board.new(10, 8, 5)
    @player_E = Player.new("E")
    @player_F = Player.new("F")
    @non_winning_row_board.place_mark(@player_E, 6)
    @non_winning_row_board.place_mark(@player_F, 5)
    @non_winning_row_board.place_mark(@player_E, 5)
    @non_winning_row_board.place_mark(@player_F, 5)
    @non_winning_row_board.place_mark(@player_E, 4)
    @non_winning_row_board.place_mark(@player_F, 5)
    @non_winning_row_board.place_mark(@player_E, 3)
    @non_winning_row_board.place_mark(@player_F, 5)
    @non_winning_row_board.place_mark(@player_E, 2)
    @non_winning_row_board.place_mark(@player_F, 7)
    @non_winning_row_board.place_mark(@player_E, 1)
    puts "Non-winning full row board:"
    @non_winning_row_board.render
  end

  def create_winning_diag_board
    @winning_diag_board = Board.new(10, 8, 5)
    @player_I = Player.new("I")
    @player_J = Player.new("J")
    @winning_diag_board.place_mark(@player_I, 2)
    @winning_diag_board.place_mark(@player_J, 3)
    @winning_diag_board.place_mark(@player_I, 3)
    @winning_diag_board.place_mark(@player_J, 4)
    @winning_diag_board.place_mark(@player_I, 4)
    @winning_diag_board.place_mark(@player_J, 1)
    @winning_diag_board.place_mark(@player_I, 4)
    @winning_diag_board.place_mark(@player_J, 5)
    @winning_diag_board.place_mark(@player_I, 5)
    @winning_diag_board.place_mark(@player_J, 5)
    @winning_diag_board.place_mark(@player_I, 5)
    @winning_diag_board.place_mark(@player_J, 7)
    @winning_diag_board.place_mark(@player_I, 6)
    @winning_diag_board.place_mark(@player_J, 6)
    @winning_diag_board.place_mark(@player_I, 6)
    @winning_diag_board.place_mark(@player_J, 6)
    @winning_diag_board.place_mark(@player_I, 6)
    puts "Winning diagonal board:"
    @winning_diag_board.render
  end

  def create_non_winning_diag_board
    @non_winning_diag_board = Board.new(10, 8, 5)
    @player_K = Player.new("K")
    @player_L = Player.new("L")
    @non_winning_diag_board.place_mark(@player_K, 2)
    @non_winning_diag_board.place_mark(@player_L, 3)
    @non_winning_diag_board.place_mark(@player_K, 3)
    @non_winning_diag_board.place_mark(@player_L, 4)
    @non_winning_diag_board.place_mark(@player_K, 4)
    @non_winning_diag_board.place_mark(@player_L, 4)
    @non_winning_diag_board.place_mark(@player_K, 2)
    @non_winning_diag_board.place_mark(@player_L, 5)
    @non_winning_diag_board.place_mark(@player_K, 5)
    @non_winning_diag_board.place_mark(@player_L, 5)
    @non_winning_diag_board.place_mark(@player_K, 5)
    @non_winning_diag_board.place_mark(@player_L, 7)
    @non_winning_diag_board.place_mark(@player_K, 6)
    @non_winning_diag_board.place_mark(@player_L, 6)
    @non_winning_diag_board.place_mark(@player_K, 6)
    @non_winning_diag_board.place_mark(@player_L, 6)
    @non_winning_diag_board.place_mark(@player_K, 6)
    puts "Non-winning full diagonal board:"
    @non_winning_diag_board.render
  end

  before(:all) do
    puts "\nEach tested board requires 5 consecutive marks to win.\n\n"
    create_winning_col_board
    create_winning_row_board
    create_non_winning_col_board
    create_non_winning_row_board
    create_winning_diag_board
    create_non_winning_diag_board
  end

  describe '#won?' do
    it "works on a board with a winning column" do
      expect(@winning_col_board.won?([3, 5])).to eq(true)
    end

    it "works on a board with a winning row" do
      expect(@winning_row_board.won?([7, 1])).to eq(true)
    end

    it "works on a board with a full column, without a winning column" do
      expect(@non_winning_col_board.won?([2, 5])).to eq(false)
    end

    it "works on a board with a full row, without a winning row" do
      expect(@non_winning_row_board.won?([7, 0])).to eq(false)
    end

    it "works on a board with a winning diagonal" do
      expect(@winning_diag_board.won?([3, 5])).to eq(true)
    end

    it "works on a board with a full diagonal, without a winning diagonal" do
      expect(@non_winning_diag_board.won?([3, 5])).to eq(false)
    end
  end
end
