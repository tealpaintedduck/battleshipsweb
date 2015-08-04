require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content"What's your name?"
  end

  scenario 'I can enter my name' do
    visit '/new_game'
    fill_in 'first_name', with: 'Sarah'
    click_button 'Submit'
    expect(page).to have_content 'Ready, Sarah?! You are playing against COMPUTER'
  end

  scenario 'raise an error when there is no name' do
    visit '/new_game'
    click_button 'Submit'
    expect(page).to have_content('Whoops')
  end

end
