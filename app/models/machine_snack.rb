class MachineSnack < ApplicationRecord
  belongs_to :machine
  belongs_to :snack

  validates_presence_of :snack_id, :machine_id
end
