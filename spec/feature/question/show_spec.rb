require 'rails_helper'

feature 'User can look at the question and its answers', %q{
  In order to get a solution to my problem
  As an user
  I'd like to be able to see the question and it's answers
} do

  given(:user) { create(:user) }
  given(:question) { create(:question, user_id: user.id) }
  given!(:answer) { create(:answer, question_id: question.id, user_id: user.id) }

  scenario 'User show the question and its answers' do
    visit question_path(question)
    save_and_open_page
    expect(page).to have_content question.body
    expect(page).to have_content answer.body
  end

end
