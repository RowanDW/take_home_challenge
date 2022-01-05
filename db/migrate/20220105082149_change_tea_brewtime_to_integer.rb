class ChangeTeaBrewtimeToInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :teas, :brew_time
    add_column :teas, :brew_time, :integer
  end
end
