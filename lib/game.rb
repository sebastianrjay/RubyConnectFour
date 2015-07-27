require_relative 'board'
require_relative 'errors'
require_relative 'player'

class Game

  def initialize
    @moves_made = 0
    @board, @max_moves = nil, nil
    @players = [Player.new("A"), Player.new("B")]
  end

  def create_board
    width, height = get_parameter("grid width"), get_parameter("grid height")

    begin
      adjacent_tiles_to_win = get_parameter("number of adjacent
tiles required to win (must be at least 3)")
      raise InvalidInputError if adjacent_tiles_to_win > [width, height].min

    rescue InvalidInputError
      puts "Invalid Input!"
      retry
    end

    @max_moves = width * height
    @board = Board.new(width, height, adjacent_tiles_to_win)
  end

  def get_parameter(param_type)
    begin
      puts "\nPlease enter the desired " + param_type + "."
      param = get_num
      raise InvalidInputError if param < 3

    rescue InvalidInputError
      puts "Invalid Input!"
      retry
    end

    param
  end

  def get_num
    gets.chomp.to_i
  end

  def play
    @board.render
    until @moves_made == @max_moves
      current_player = @players[@moves_made % 2]

      begin
        puts "Player #{current_player.mark}, please enter the column number at
which you would like to place your mark."

        col = get_num
        new_pos = @board.place_mark(current_player, col)
        @board.render
        if @board.won?(new_pos)
          puts "Player #{current_player.mark} wins!"
          exit 0
        end

        @moves_made += 1

      rescue OutOfBoundsError
        puts "Out of bounds!"
        retry
      rescue FullColumnError
        puts "Column is already full!"
        retry
      end
    end
  end

  def run
    puts "\nWelcome to Connect Four, players A and B. Press CONTROL-C to quit at
any time.\n"
    create_board
    play

    puts "It's a draw!"
    exit 0
  end
end
