class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :child

  validates :image, :text, :title, :date, presence: true
end
