FactoryBot.define do
  factory :member do
    transient do
      person { Gimei.name }
    end

    member_name                  { person.kanji }
    organization                 { Faker::Company.name[1..40] }
    position                     { Faker::Commerce.department[1..40] }
    work_info                    { Faker::Lorem.sentence }
    valuation_id                 { Faker::Number.between(from: 2, to: 5) }
    communication                { Faker::Number.between(from: 1, to: 10) }
    leadership                   { Faker::Number.between(from: 1, to: 10) }
    skill                        { Faker::Number.between(from: 1, to: 10) }
    motivation                   { Faker::Number.between(from: 1, to: 10) }
    association :user

    after(:build) do |member|
      member.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end 
  end
end
