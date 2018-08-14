require_relative 'player.rb'

class Game

  attr_accessor :p1, :p2, :turn
  LIVES = 3

  def initialize
    @p1 = Player.new("Player 1", LIVES)
    @p2 = Player.new("Player 2", LIVES)
    @turn = "Player 1"
  end

  def start_next_turn
    puts "----- NEW TURN -----"
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{turn}: What does #{num1} plus #{num2} equal?"
    print ">"
    answer = gets.chomp.to_i
    if answer == num1 + num2
      puts "#{turn}: CORRECT! Wow, you're so smart."
      end_turn
    else
      puts "#{turn}: WRONG! So very, very wrong."
      if turn == "Player 1"
        @p1.lose_life
      else
        @p2.lose_life
      end
      end_turn
    end
  end

  def end_turn
    if turn == "Player 1"
      @turn = "Player 2"
    else
      @turn = "Player 1"
    end
    check_for_winner
  end

  def check_for_winner
    if @p1.lives == 0
      end_game("Player 2", @p2.lives)
    elsif @p2.lives == 0
      end_game("Player 1", @p1.lives)
    else
      start_next_turn
    end
  end

  def end_game(winner, lives)
    puts "#{winner} wins with a score of #{lives}/3"
    puts "----- GAME OVER -----"
    puts "Insert 25¢ to play again."
  end

  def start_game
    puts "Welcome to Math War!"
    start_next_turn
  end

end
