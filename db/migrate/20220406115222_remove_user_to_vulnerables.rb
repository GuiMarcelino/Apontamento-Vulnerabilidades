class RemoveUserToVulnerables < ActiveRecord::Migration[5.2]
  def change
    remove_reference :vulnerables, :user, index: true, foreign_key: true
  end
end
