feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Hello!'
  end
end

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Cong vs Dan'
  end
end

feature 'View hit points' do
  scenario 'see Player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Dan: 60HP'
  end
end

feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content 'Cong attacked Dan'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack!'
    click_link 'OK'
    expect(page).not_to have_content 'Dan: 60HP'
    expect(page).to have_content 'Dan: 50HP'
  end

feature 'Switching turns' do
  context 'seeing the current turn' do
    scenario 'at the start' do
      sign_in_and_play
      expect(page).to have_content "Cong's turn"
    end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_button 'Attack!'
      click_link 'OK'
      expect(page).to have_content "Dan's turn"
      expect(page).not_to have_content "Cong's turn"
    end

  end
end
end
