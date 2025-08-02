class AddQuestion6ToComposers < ActiveRecord::Migration[7.1]
  def change
    add_column :composers, :question6, :string
  end
end
