class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :image, :text, :title, :date, presence:true
end
