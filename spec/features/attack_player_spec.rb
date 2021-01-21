# frozen_string_literal: true

feature 'Attacking players' do
  scenario 'attacking player 2' do
    sign_in_and_play
    click_button 'Attack Bruce'
    expect(page).to have_content('You attacked Bruce!')
  end
end
