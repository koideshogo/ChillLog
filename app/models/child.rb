class Child < ApplicationRecord
  belongs_to :user
  # belongs_to :event
  validates :name,  presence: true
end
