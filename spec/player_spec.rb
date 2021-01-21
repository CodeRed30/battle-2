# frozen_string_literal: true

require 'player'

describe Player do
  subject(:alfred) { Player.new('Alfred') }
  subject(:bruce) { Player.new('Bruce') }

  it 'returns its own #name' do
    expect(alfred.name).to eq 'Alfred'
  end

  context 'hit points' do
    it 'should initialize with the default value' do
      expect(alfred.hit_points).to eq described_class::DEFAULT_HP
    end

    it 'should receive damage' do
      expect(alfred).to respond_to(:receive_damage)
    end

    it 'should reduce when damage received' do
      expect { bruce.receive_damage }.to change { bruce.hit_points }.by(-10)
    end
  end
end
