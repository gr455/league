class AddColumnLastName < ActiveRecord::Migration[5.2]
  def change
  	add_column :players,:lastname,:string
  end
end
