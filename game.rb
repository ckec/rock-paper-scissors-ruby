# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'

SIGNS = %w[rock paper scissors].freeze

# Contains logic for the Game class
class Game
  def initialize
    @computer = Computer.new
    @human_score = 0
    @computer_score = 0
  end

  def play
    puts "\nWelcome to the Rock Paper Scissors!"
    @human = create_human
    puts "\nLet the battle begin!"
    rounds
    declare_winner
    again?
  end

  private

  def create_human
    puts "\nChoose your name: "
    @name = gets.chomp
    Human.new(@name)
  end

  def check_score
    puts "\nScore is: Human: #{@human_score}, Computer: #{@computer_score}"
  end

  def declare_winner
    if @human_score == 5
      puts "\n#{@name} won! Good job!"
    elsif @computer_score == 5
      puts "\nYou lost! Better luck next time!"
    end
  end

  def winner?
    return unless @human_score == 5 || @computer_score == 5

    true
  end

  def rounds
    loop do
      human_pick = @human.human_pick
      computer_pick = @computer.computer_pick
      if human_pick == computer_pick
        puts "\nSame sign!"
      elsif human_pick == 'rock' && computer_pick == 'scissors' ||
            human_pick == 'scissors' && computer_pick == 'paper' ||
            human_pick == 'paper' && computer_pick == 'rock'
        puts "\nNice one #{@name}, you picked #{human_pick} and beat computer #{computer_pick}!"
        @human_score += 1
      else
        puts "\nUnlucky, computer picked #{computer_pick} and you picked #{human_pick} and lost"
        @computer_score += 1
      end
      check_score
      break if winner? == true
    end
  end

  def again?
    loop do
      print "\nPlay again: yes or no?\n"
      answer = gets.chomp.downcase
      if answer == 'yes'
        initialize
        play
      elsif answer == 'no'
        puts "\nGood game!"
        exit
      else
        puts "\nInvalid input!"
      end
    end
  end
end
