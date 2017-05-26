require 'rails_helper.rb'

feature 'Listing employees' do  
  scenario 'can list an employee' do
    visit '/employees'
    expect(page).to have_content('no employees')
  end
end 