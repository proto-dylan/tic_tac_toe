# frozen_string_literal: true

class Board
  def initialize
    @tile = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def play
    game = 'on'
    turn = 1
    puts "\n\n\n\n\n"
    puts 'Welcome to TIC TAC TACULAR'
    puts "\n\n"
    puts "Player 'X' goes first"
    puts ''
    display

    while game == 'on'
      @player = if turn.odd? # player 1 is odd player 2 is even
                  'X'
                else
                  'O'
                end
      move = get_move
      @tile.each_with_index do |arr, row|
        arr.each_with_index do |value, column|
          @tile [row][column] = @player if value.to_i == move.to_i
        end
      end

      display
      if checkWin(@player)
        puts "Player #{@player} Wins"
        new_game
      end
      turn += 1
      next unless turn > 9

      game = 'off'
      puts ' TIE  Game over'
      newGame
    end
  end

  def valid_move?(input)
    @tile.flatten.include?(input)
  end

  private

  def get_move
    move = ''
    until valid_move?(move)
      puts "Player #{@player}: choose your move (tile 1-9)"
      move = gets.chomp.to_s
    end
    move
  end

  
  def display
    puts "\n\n\n"
    puts '====================='
    puts '||     |     |     ||'
    @tile.each_with_index do |row, x|
      print '||'
      row.each_with_index do |cell, y|
        if y <= 1
          print "  #{cell}  |"
        else
          print "  #{cell}  "
        end
      end
      puts "||\n"
      if x != 2
        puts '|| ____|_____|_____||'
        puts '||     |     |     ||'
      else
        puts '||     |     |     ||'
      end
    end
    puts '====================='
    puts "\n\n\n\n"
  end

  def checkWin(player)
    win = false
    3.times do |x|
      if @tile[x][0] == player && @tile[x][1] == player && @tile[x][2] == player # Check rows/columns for win
        win = true
      elsif @tile[0][x] == player && @tile[1][x] == player && @tile[2][x] == player
        win = true
      end
    end

    if @tile[0][0] == player && @tile[1][1] == player && @tile[2][2] == player # Check diagonals for win
      win = true
    elsif @tile[0][2] == player && @tile[1][1] == player && @tile[2][0] == player
      win = true
    end
    win
  end

  def new_game
    puts 'New game? (y,n)'
    answer = gets.chomp
    if %w[y Y].include?(answer)
      board = Board.new
      board.play
    else
      puts "Later 'tater"
      exit!
    end
  end
end

#board = Board.new
#board.play
