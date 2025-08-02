class AddQuestion7ToComposers < ActiveRecord::Migration[7.1]
  def change
    add_column :composers, :question7, :string
  end
end
