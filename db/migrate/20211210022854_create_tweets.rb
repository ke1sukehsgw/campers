class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :location_title
      t.string :prefectures
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
