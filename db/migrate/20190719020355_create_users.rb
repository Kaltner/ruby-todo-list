class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name # name
      t.string :email # email
      t.string :password # password
      t.timestamps # timestamps
      t.datetime :deleted_at # soft delete
    end
  end
end
