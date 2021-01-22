# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  it { is_expected.to respond_to :attack }

  describe '#player_1' do
  it 'retrieves the first player' do
    expect(game.player_1).to eq player_1
  end
end

describe '#player_2' do
  it 'retrieves the second player' do
    expect(game.player_2).to eq player_2
  end
end

  describe '#attack' do
    it 'reduces player HP' do
      expect(player_2).to receive(:receive_damage)
      game.attack
    end
  end
end
