class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.text :description
      t.date :starts_at
      t.date :ends_at
      t.boolean :premium, default: false
      t.boolean :state, default: false

      t.timestamps
    end
    add_index :offers, :advertiser_name, unique: true
  end
end
