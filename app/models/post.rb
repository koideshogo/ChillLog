class Post < ApplicationRecord
  belongs_to :user

  validates :image, :text, :title, presence:true
end
