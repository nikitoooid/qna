require 'rails_helper'

feature 'User can look at the question and its answers', %q{
  In order to get a solution to my problem
  As an user
  I'd like to be able to see the question and it's answers
} do

  given(:question) { create(:question) }

  scenario 'User show the question and its answers' do
    question.answers.push create(:answer)

    visit question_path(question)

    expect(page).to have_content 'Answer text'
  end

end
