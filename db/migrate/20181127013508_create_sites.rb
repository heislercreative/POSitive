class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :platform
      t.string :profile_url
      t.boolean :active
      t.integer :priority
      t.integer :user_id

      t.timestamps
    end
  end
end
