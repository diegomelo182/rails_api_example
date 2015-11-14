class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.boolean :active

      t.timestamps null: false
    end
  end
end
