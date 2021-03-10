class Status < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :active, :boolean, default: true
  end
end
