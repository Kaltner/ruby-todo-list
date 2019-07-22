class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.integer :todo_id
      t.string :description
      t.boolean :checked
      t.timestamps
    end
    add_foreign_key :todo_items, :todos
  end
end
