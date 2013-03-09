# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    youtube_id "MyString"
    title "MyString"
    description "MyText"
  end
end
