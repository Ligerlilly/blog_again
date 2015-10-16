FactoryGirl.define do
  factory :post do
    title 'Factory made post'
    content 'Boring'
  end

  factory :tag do
    name 'test'
  end
end
