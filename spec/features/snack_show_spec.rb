require 'rails_helper'

RSpec.describe 'Snack Show Spec', type: :feature do
  it 'shows information about the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    bar_2  = owner.machines.create(location: "Bar 2")
    snack = dons.snacks.create(name: "Snack 1", price: 5.00)
    MachineSnack.create!(machine: bar_2, snack: snack)

    visit snack_path(snack)

    expect(page).to have_content("Name: #{snack.name}")
    expect(page).to have_content("Price: #{snack.price}")
    expect(page).to have_content("Locations:")
  end
end
