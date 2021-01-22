# frozen_string_literal: true

class Game
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = true
  end

  def attack
    current_turn.receive_damage
    if current_turn.hit_points <= 0
    @turn = !@turn
    false
    else
    @turn = !@turn
    true
    end
  end

  def current_turn
    !@turn ? @player_1 : @player_2
  end

end
