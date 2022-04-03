class Vulnerable < ApplicationRecord
  has_many :users
  has_many :historics

end