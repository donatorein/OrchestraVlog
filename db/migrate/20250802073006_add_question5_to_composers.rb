class AddQuestion5ToComposers < ActiveRecord::Migration[7.1]
  def change
    add_column :composers, :question5, :string
  end
end
