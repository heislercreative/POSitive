class CreateIndustryPlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :industry_platforms do |t|
      t.integer :industry_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
