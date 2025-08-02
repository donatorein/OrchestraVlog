class AddACountToComposers < ActiveRecord::Migration[7.1]
  def change
    add_column :composers, :a_count, :integer
  end
end
