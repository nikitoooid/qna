require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it 'is expected to confirm its authorship over the question' do
    user = create(:user)
    question = create(:question, user_id: user.id)

    expect(user.author_of? question).to be_truthy
  end

  it 'is expected to confirm its authorship over the answer' do
    user = create(:user)
    question = create(:question, user_id: user.id)
    answer = create(:answer, question_id: question.id, user_id: user.id)

    expect(user.author_of? answer).to be_truthy
  end
end
