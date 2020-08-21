class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :short_url
      t.string :original_url
      t.integer :views_count

      t.timestamps
    end
  end
end
