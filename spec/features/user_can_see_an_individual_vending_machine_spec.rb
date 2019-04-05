require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'shows a list of all snacks and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "Snack 1", price: 2.50)
    snack_2 = dons.snacks.create(name: "Snack 2", price: 5.00)

    visit machine_path(dons)

    expect(page).to have_content("Snacks:")
    within ".snack-#{snack_1.id}" do
      expect(page).to have_content("#{snack_1.name}, Price: #{snack_1.price}")
    end
    within ".snack-#{snack_2.id}" do
      expect(page).to have_content("#{snack_2.name}, Price: #{snack_2.price}")
    end
  end

  it 'shows the average snack price in a machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Snack 1", price: 5.00)
    dons.snacks.create(name: "Snack 2", price: 10.00)

    visit machine_path(dons)

    expect(page).to have_content("Average Snack Price: $7.50")
  end
end
