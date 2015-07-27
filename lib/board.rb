class Board

  def initialize(width, height, adjacent_tiles_to_win)
    @adjacent_marks_to_win = adjacent_tiles_to_win
    create_grid(width, height)
  end

  def place_mark(player, column)
    raise OutOfBoundsError if column > @grid[0].size || column < 1
    (@grid.size - 1).downto(0) do |i|
      if @grid[i][column - 1] != " " && i == 0
        raise FullColumnError
      elsif @grid[i][column - 1] == " "
        @grid[i][column - 1] = player.mark
        return [i, column - 1]
      end
    end
  end

  def render
    puts
    @grid.each do |row|
      print "| "
      row.each do |space|
        print space + " | "
      end
      puts
    end

    @grid[0].size.times do |i|
      char = (i + 1).to_s
      case char.length
        when 1
          print "  " + char + " "
        when 2
          print "  " + char
        when 3
          print " " + char
        else
          print char
      end
    end
    2.times { puts }
  end

  def won?(new_pos)
    winning_row?(new_pos) || winning_col?(new_pos) || winning_diagonal?(new_pos)
  end

  private

    def add_cols
      0.upto(@grid.size - @adjacent_marks_to_win) do |i|
        0.upto(@grid[i].size - 1) do |j|
          col_positions = Set.new
          i.upto(i + @adjacent_marks_to_win - 1) do |row_num|
            col_positions << [row_num, j]
          end
          @unfilled_position_sets << col_positions
        end
      end
    end

    def add_diagonals
      0.upto(@grid.size - @adjacent_marks_to_win) do |start_row|
        0.upto(@grid[start_row].size - @adjacent_marks_to_win) do |start_col|
          diag_positions = Set.new
          0.upto(@adjacent_marks_to_win - 1) do |acc|
            diag_positions << [start_row + acc, start_col + acc]
          end
          @unfilled_position_sets << diag_positions
        end
      end

      (@grid.size - 1).downto(@adjacent_marks_to_win - 1) do |start_row|
        0.upto(@grid[start_row].size - @adjacent_marks_to_win) do |start_col|
          diag_positions = Set.new
          0.upto(@adjacent_marks_to_win - 1) do |acc|
            diag_positions << [start_row - acc, start_col + acc]
          end
          @unfilled_position_sets << diag_positions
        end
      end
    end

    def add_rows
      0.upto(@grid.size - 1) do |i|
        0.upto(@grid[i].length - @adjacent_marks_to_win) do |j|
          row_positions = Set.new
          j.upto(j + @adjacent_marks_to_win - 1) do |col_num|
            row_positions << [i, col_num]
          end
          @unfilled_position_sets << row_positions
        end
      end
    end

    def create_grid(width, height)
      @grid = []
      height.times do |h|
        @grid[h] = []
        width.times do |w|
          @grid[h][w] = " "
        end
      end
    end

    def winning_col?(new_pos)
      start_row = [new_pos[0] - @adjacent_marks_to_win + 1, 0].max
      end_row = [new_pos[0] + @adjacent_marks_to_win - 1, @grid.size - 1].min
      consecutive_marks, previous_mark = 1, @grid[start_row][new_pos[1]]
      (start_row + 1).upto(end_row) do |row_idx|
        this_mark = @grid[row_idx][new_pos[1]]
        if this_mark == previous_mark && this_mark != " "
          consecutive_marks += 1
          return true if consecutive_marks == @adjacent_marks_to_win
        else
          consecutive_marks = 1
        end
        previous_mark = this_mark
      end

      false
    end

    def winning_diagonal?(new_pos)
      winning_first_diagonal?(new_pos) || winning_second_diagonal?(new_pos)
    end

    def winning_row?(new_pos)
      start_col = [new_pos[1] - @adjacent_marks_to_win + 1, 0].max
      end_col = [new_pos[1] + @adjacent_marks_to_win - 1, @grid[0].size - 1].min
      consecutive_marks, previous_mark = 1, @grid[new_pos[0]][start_col]
      (start_col + 1).upto(end_col) do |col_idx|
        this_mark = @grid[new_pos[0]][col_idx]
        if this_mark == previous_mark && this_mark != " "
          consecutive_marks += 1
          return true if consecutive_marks == @adjacent_marks_to_win
        else
          consecutive_marks = 1
        end
        previous_mark = this_mark
      end

      false
    end

    def winning_first_diagonal?(new_pos)
      start_row = new_pos[0] - @adjacent_marks_to_win + 1
      start_col = new_pos[1] - @adjacent_marks_to_win + 1
      if start_row < 0
        diff = 0 - start_row
        start_row += diff; start_col += diff
      end

      if start_col < 0
        diff = 0 - start_col
        start_row += diff; start_col += diff
      end

      end_row = new_pos[0] + @adjacent_marks_to_win - 1
      end_col = new_pos[1] + @adjacent_marks_to_win - 1

      if end_row > @grid.size - 1
        diff = end_row - @grid.size + 1
        end_row -= diff; end_col -= diff
      end

      if end_col > @grid[0].size - 1
        diff = end_col - @grid[0].size + 1
        end_row -= diff; end_col -= diff
      end

      previous_mark, consecutive_marks = @grid[start_row][start_col], 1
      row_idx, col_idx = start_row + 1, start_col + 1
      while row_idx <= end_row
        this_mark = @grid[row_idx][col_idx]
        if this_mark == previous_mark && this_mark != " "
          consecutive_marks += 1
          return true if consecutive_marks == @adjacent_marks_to_win
        else
          consecutive_marks = 1
        end
        row_idx += 1; col_idx += 1
        previous_mark = this_mark
      end

      false
    end

    def winning_second_diagonal?(new_pos)
      start_row = new_pos[0] + @adjacent_marks_to_win - 1
      start_col = new_pos[1] - @adjacent_marks_to_win + 1

      if start_row > @grid.size - 1
        diff = start_row - @grid.size + 1
        start_row -= diff; start_col += diff
      end

      if start_col < 0
        diff = 0 - start_col
        start_row -= diff; start_col += diff
      end

      end_row = new_pos[0] - @adjacent_marks_to_win + 1
      end_col = new_pos[1] + @adjacent_marks_to_win - 1

      if end_row < 0
        diff = 0 - end_row
        end_row += diff; end_col -= diff
      end

      if end_col > @grid[0].size - 1
        diff = end_col - @grid[0].size + 1
        end_row += diff; end_col -= diff
      end

      previous_mark, consecutive_marks = @grid[start_row][start_col], 1
      row_idx, col_idx = start_row - 1, start_col + 1
      while row_idx >= end_row
        this_mark = @grid[row_idx][col_idx]
        if this_mark == previous_mark && this_mark != " "
          consecutive_marks += 1
          return true if consecutive_marks == @adjacent_marks_to_win
        else
          consecutive_marks = 1
        end
        row_idx -= 1; col_idx += 1
        previous_mark = this_mark
      end

      false
    end
end
