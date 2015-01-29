
# oop_janken/oop_rps.rb

# Requirements:
# The first step is to think about the specifications and requirements for the application, in plain English.

# This version will be a two-player game. In Japan, when people play Janken, they can play with more than two people, but in the US, it's usually limited to two people.
# - Player One
# - Computer

# There are three choices:
# 1. Rock
# 2. Paper
# 3. Scissors

# There is a defined hierarchy of winner vs. loser:
# 1. Rock > Scissors
# 2. Paper > Rock
# 3. Scissors > Paper
# 4. Tie => Go again

# I'll need to record each player's choice, and determin who won, using the hierarchy defined above.

# Implementation Ideas
# 1. Classes
# - Player
# - Hand

# 2. Game Play
# - Each Player gets to choose
# - The winner is announced
# - Play again?

# 3. Bonus Features I could implement (but probably won't for the sake of simplicity)
# - Keeping Score
# - Betting

class Player
  attr_accessor :hand
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

class HumanPlayer < Player
  def hand_choice
    begin
      puts "Please choose [r] for Rock, [p] for Paper, or [s] for Scissors."
      choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(choice)
    self.hand = choice
  end
end

class ComputerPlayer < Player
  def hand_choice
    self.hand = Game::CHOICES.keys.sample
  end
end

class Game
  CHOICES = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors' }

  attr_reader :player, :computer
  
  def initialize
    @player = HumanPlayer.new("Andrew")
    @computer = ComputerPlayer.new("Computer")
  end
  
  def display_winning_message(winning_choice)
    case winning_choice
    when 'r'
      puts "You: Rock | Me: Scissors"
    when 'p'
      puts "You: Paper | Me: Rock"
    when 's'
      puts "You: Scissors | Me: Paper"
    end
  end

  def display_losing_message(losing_choice)
    case losing_choice
    when 'r'
      puts "You: Rock | Me: Paper"
    when 'p' 
      puts "You: Paper | Me: Scissors"
    when 's'
      puts "You: Scissors | Me: Rock"
    end
  end

  def determine_winner
    if player.hand == computer.hand
      puts "It's a tie!"
    elsif (player.hand == 'r' && computer.hand == 's') || (player.hand == 'p' && computer.hand == 'r') || (player.hand == 's' && computer.hand == 'p')
      display_winning_message(player.hand)
      puts "You win!"
    else
      display_losing_message(player.hand)
      puts "Sorry, you lose..."
    end
  end

  def play_again
    puts "Would you like to play again? (y/n)"
    gets.chomp.downcase
  end
  
  def play
    puts "Let's play 'Rock, Paper, Scissors!'"
    loop do
      begin
        player.hand_choice
        computer.hand_choice
        determine_winner
        break if play_again != 'y'
      end
    end
    puts "Thanks for playing!"
    sleep 0.5
    system 'clear'
  end
end

Game.new.play
