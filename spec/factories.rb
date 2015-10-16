FactoryGirl.define do
  factory :post do
    title 'Factory made post'
    content 'Boring'
  end

  factory :tag do
    name 'test'
  end
  factory :user do
    email 'fred@aol.com'
    password 'password'
  end
end
