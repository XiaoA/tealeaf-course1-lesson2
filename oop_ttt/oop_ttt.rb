# A Simple Tic-Tac-Toe Game in Ruby, refactored for OOP

# Implementation Notes/Brainstorming...
# 
# * What is Tic-Tac-Toe?
# - A game with two players, and 9 board positions
# - One player is assigned "X"; one player is assigned "Y"
# - The object is to get three of your "X" or "Y" marks in a row, while preventing the other player from doing the same.

# * Things (could become classes)
# - board
# - pieces/markers
# - squares
# - player(s)

# * Actions (could become methods or modules)
# - attack
# - defend (block)
# - draw the board

# * Potential Features
# - AI that blocks the third in a 'two-in-a-row' scenario
# - Play again?
# - Store names/scores/bets?

# * Anything else to consider?

# * Implementation Outline
# - Board
#   + draw board
#   + empty squares?
#   + marked squares?
# - Square
#   + mark
#   + occupied?
# - Player
#   + name
#   + "X" vs. "0"
#   + attack
#   + defend
# - Game
#   + player 1 place mark 
#   + player 2 place mark
#   + check for winner
#   + declare result
#   + play again?

class Board
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @board_position = {}
    (1..9).each {|position| @board_position[position] = Square.new(' ') }
  end

  def empty_squares
    @board_position.select {|_, square| square.empty?}.values
  end

  def empty_positions
    @board_position.select {|_, square| square.empty?}.keys
  end

  def all_squares_marked?
    empty_squares.size == 0
  end

  def three_squares_in_a_row?(marker)
    WINNING_LINES.each do |line|
      return true if @board_position[line[0]].value == marker && @board_position[line[1]].value  == marker && @board_position[line[2]].value == marker
    end
    false
  end

  def mark_square(position, marker)
    @board_position[position].mark(marker)
  end

  def draw_board
    system 'clear'
    puts
    puts "     |     |"
    puts "  #{@board_position[1]}  |  #{@board_position[2]}  |  #{@board_position[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@board_position[4]}  |  #{@board_position[5]}  |  #{@board_position[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@board_position[7]}  |  #{@board_position[8]}  |  #{@board_position[9]}"
    puts "     |     |"
    puts
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Square
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def empty?
    @value == ' '
  end

  def mark(marker)
    @value = marker
  end

  def to_s
    @value
  end
end

class Game
  def initialize
    @board = Board.new
    @human = Player.new("Andrew", "X")
    @computer = Player.new("Computer", "O")
    @current_player = @human
  end
  
  def current_player_marks_square
    if @current_player == @human
      begin
        puts "Choose a position #{@board.empty_positions} to place a piece:"
        position = gets.chomp.to_i
      end until @board.empty_positions.include?(position)
    else
      position = @board.empty_positions.sample
    end
    @board.mark_square(position, @current_player.marker)
  end

  def alternate_player
    if @current_player == @human
      @current_player = @computer
    else
      @current_player = @human
    end
  end
  
  def current_player_wins?
    @board.three_squares_in_a_row?(@current_player.marker)
  end

  def play
    @board.draw_board
    loop do
      current_player_marks_square
      @board.draw_board
      if current_player_wins?
        puts "#{@current_player.name} wins!"
        break
      elsif @board.all_squares_marked?
        puts "It's a tie."
        break
      else
        alternate_player
      end
    end
  end

  def play_again?
    loop do
      puts "Would you like to play again? (y/n)"
      play_again_answer = gets.chomp.downcase
      if play_again_answer == 'y'
        Game.new.play
      else
        puts "Thanks for playing!"
        sleep 1.5
        system 'clear'
        break
      end
    end
  end
end

Game.new.play
Game.new.play_again?
