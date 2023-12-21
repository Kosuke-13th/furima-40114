class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false
      t.integer    :prefecture_id,  null: false
      t.string     :city,           null: false
      t.string     :block,          null: false
      t.string     :buildings_name
      t.string     :phone_number,   null: false
      t.references :buy,            null: false, foreign_key: true
      t.timestamps
    end
  end
end