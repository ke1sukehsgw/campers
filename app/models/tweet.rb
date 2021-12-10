class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
  validates :location_title
  validates :prefectures
  validates :image
  end
end
