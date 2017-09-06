require 'player'

describe Player do
  subject(:cong) { Player.new('Cong') }
  subject(:dan) { Player.new('Dan') }

  describe '#name' do
    it 'returns the name' do
      expect(cong.name).to eq 'Cong'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(cong.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(dan).to receive(:receive_damage)
      cong.attack(dan)
    end
  end

  describe '#receive_damage' do
    it 'reduces hit points' do
      expect { cong.receive_damage }.to change { cong.hit_points }.by(-10)
    end
  end
end
