class AddTableVulnerables < ActiveRecord::Migration[5.2]
  def change
    create_table :vulnerables do |t|

      t.string :nome
      t.text :description
      t.integer :level
      t.integer :status
      t.text :solution

      t.references :created_by, index: true, foreign_key: { to_table: :users }
      t.references :updated_by, index: true, foreign_key: { to_table: :users }

      t.boolean :active, index: true, default: true
      t.datetime :deleted_at, index: true
      t.datetime :created_at, index: true
      t.datetime :updated_at, index: true
      t.timestamps
    end
  end
end
