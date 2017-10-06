class AddBoxtoTodo < ActiveRecord::Migration[5.1]
  def change
  	add_column :todos, :box, :boolean
  end
end
