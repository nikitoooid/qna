FactoryBot.define do
  factory :answer do
    body { "Answer text" }
    association :question

    trait :invalid do
      body { nil }
    end
  end
end
