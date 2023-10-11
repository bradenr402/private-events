class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :datetime
      t.references :creator

      t.timestamps
    end
  end
end
