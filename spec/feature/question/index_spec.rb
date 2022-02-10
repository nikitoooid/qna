require 'rails_helper'

feature 'User can look at the list of all questions', %q{
  In order to find the solution
  As an user
  I'd like to be able to get the list of all questions
} do

  scenario 'User gets the list of all questions' do
    create_list(:question, 2)
    visit questions_path

    expect(page).to have_content "MyString"
    expect(page).to have_content "MyText"
  end

end
