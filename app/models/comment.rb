class Comment < ActiveRecord::Base
  belongs_to :commmentable, polymorphic: true
  belongs_to :user
  validates :content, presence: true
end
