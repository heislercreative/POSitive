class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :business_name
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state_initials
      t.integer :zip
      t.integer :phone
      t.string :slug
      t.integer :industry_id

      t.timestamps
    end
  end
end
