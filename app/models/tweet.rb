class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
  validates :location_title
  validates :prefectures_id
  validates :text
  validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures

  validates :prefectures_id, numericality: { other_than: 0 ,message: "can't be blank" }
end
