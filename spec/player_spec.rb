# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    context 'when specifying the player type' do
      subject(:player) { described_class.new('x') }

      it 'player type is x' do
        expect(player.type).to eq('x')
      end
    end
  end
end
