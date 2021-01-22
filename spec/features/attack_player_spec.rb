# frozen_string_literal: true

feature 'Attacking players' do
  scenario 'attacking player 2' do
    sign_in_and_play
    click_button 'Attack Bruce'
    expect(page).to have_content('Your turn: Alfred!')
  end

  scenario 'attacking player 1' do
    sign_in_and_play
    click_button 'Attack Bruce'
    click_link 'OK'
    click_button 'Attack Alfred'
    expect(page).to have_content('Your turn: Bruce!')
  end

end
