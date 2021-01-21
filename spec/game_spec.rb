# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:player) { double :player }

  it { is_expected.to respond_to :attack }

  describe '#attack' do
    it 'reduces player HP' do
      expect(player).to receive(:receive_damage)
      game.attack(player)
    end
  end
end
