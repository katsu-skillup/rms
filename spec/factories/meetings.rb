FactoryBot.define do
  factory :meeting do

    meeting_date                { Faker::Date.between(from: '2010-01-01', to: '2021-09-11')}
    meeting_info                { Faker::Lorem.sentence }
    association :user
    association :member
  end
end
