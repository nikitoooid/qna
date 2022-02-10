require 'rails_helper'

feature 'User can create answer to the question', %{
  In order to help user to find solution
  As an authenticate user
  I'd like to be able to create the answer on question page
} do

  given(:question) { create(:question) }

  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'answers the question' do
      fill_in 'Body', with: 'Test answer'
      click_on 'Answer'

      expect(page).to have_content 'Your answer successfully created.'
      expect(page).to have_content 'Test answer'
    end

    scenario 'answers the question with errors' do
      click_on 'Answer'

      expect(page).to have_content "Your answer not created!"
    end
  end

  scenario 'Unauthenticate user cant answer the question' do
    visit question_path(question)

    expect(page).to_not have_content 'Answer'
  end

end
