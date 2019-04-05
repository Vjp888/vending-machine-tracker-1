require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should belong_to :owner }
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through :machine_snacks}
  end

  describe 'instance methods' do
    describe '.average_price' do
      it 'shows the average price of snacks in the machine' do
        owner = Owner.create(name: "Sam's Snacks")
        dons  = owner.machines.create(location: "Don's Mixed Drinks")
        dons.snacks.create(name: "Snack 1", price: 5.00)
        dons.snacks.create(name: "Snack 2", price: 10.00)

        expect(dons.average_price).to eq(7.5)
      end
    end
  end
end
