class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :image, :text, :title, presence:true
end
