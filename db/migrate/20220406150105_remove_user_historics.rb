class RemoveUserHistorics < ActiveRecord::Migration[5.2]
  def change
    remove_reference :historics, :user, index: true, foreign_key: true
  end
end
