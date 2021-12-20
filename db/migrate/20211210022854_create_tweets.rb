class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :location_title
      t.integer :prefectures_id
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
