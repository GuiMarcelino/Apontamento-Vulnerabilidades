class Vulnerable < ApplicationRecord

   enum status_type: { identified: 1, being_analyzed: 2, fixed: 3 }
   enum level_type: { low: 1, medium: 2, high: 3 }

  has_many :users
  has_many :historics

end