require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should have_and_belong_to_many :tags }

end
