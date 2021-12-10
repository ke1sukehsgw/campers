class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :location_title
  validates :prefectures
  validates :image
  end
end
