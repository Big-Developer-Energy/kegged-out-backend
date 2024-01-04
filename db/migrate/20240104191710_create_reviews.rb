class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :rating
      t.text :description
      t.string :location
      t.text :image

      t.timestamps
    end
  end
end
