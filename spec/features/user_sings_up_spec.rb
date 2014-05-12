require 'spec_helper'

feature 'User sings up' do
  scenario 'Successfully' do
    visit welcome_index_path
    click_on('Sing Up')
   # visit new_user_registration_path
    fill_in 'Email', with: 'valente.marc@gmail.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
  end
end