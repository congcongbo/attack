def sign_in_and_play
  visit '/'
  fill_in :player_1, with: 'Cong'
  fill_in :player_2, with: 'Dan'
  click_button 'Play!'
end
