class AddColumnStateTo < ActiveRecord::Migration
  def change
  	add_column :articles, :state, :string
  end
end
