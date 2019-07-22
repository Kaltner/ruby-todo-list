class CreateTodo < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :name
      t.timestamps
    end
    add_foreign_key :todos, :users
  end
end
