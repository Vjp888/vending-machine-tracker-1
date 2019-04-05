require 'rails_helper'

RSpec.describe MachineSnack, type: :model do
  # describe 'validations' do
  #   it {should validate_presence_of :snack_id}
  #   it {should validate_presence_of :machine_id}
  # end

  describe 'relationships' do
    it {belong_to :snack}
    it {belong_to :machine}
  end


end
