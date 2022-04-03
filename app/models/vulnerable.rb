class Vulnerable < ApplicationRecord

  enum status_type: { identified: 1, being_analyzed: 2, fixed: 3 }
  enum level_type: { low: 1, medium: 2, high: 3 }

  has_many :users
  has_many :historics

  scope :list, lambda {
    select("#{table_name}.*")
      .select("#{table_name}.created_by_id ")
      .select('created_by.name created_by_name')
      .joins("LEFT JOIN #{::User.table_name} created_by ON created_by.id = #{table_name}.created_by_id")
      .includes(:users)
  }

end