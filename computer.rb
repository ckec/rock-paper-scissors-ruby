# frozen_string_literal: true

# Contains logic for the Computer class
class Computer
  def computer_pick
    Game.SIGNS.sample
  end
end
