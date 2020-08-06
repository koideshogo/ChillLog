class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one :child
  accepts_nested_attributes_for :child
  has_many :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
