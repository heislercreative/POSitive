class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :platform_id
      t.string :url
      t.boolean :active
      t.integer :priority
      t.float :rating
      t.integer :locale_id

      t.timestamps
    end
  end
end
