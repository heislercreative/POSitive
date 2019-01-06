class CreateLocales < ActiveRecord::Migration[5.2]
  def change
    create_table :locales do |t|
      t.string :nickname
      t.string :address
      t.string :city
      t.string :state_initials
      t.integer :zip
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
