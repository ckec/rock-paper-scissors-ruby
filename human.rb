# frozen_string_literal: true

# Contains logic for the Human class
class Human
  def initialize(name)
    @name = name
  end

  def human_pick
    loop do
      puts "\nChoose your sign: "
      pick = gets.chomp.downcase
      return pick if Game.SIGNS.include?(pick)

      puts "\nInvalid sign!"
    end
  end
end
