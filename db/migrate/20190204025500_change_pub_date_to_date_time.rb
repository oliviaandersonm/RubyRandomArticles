class ChangePubDateToDateTime < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :pub_date, :datetime
  end
end
