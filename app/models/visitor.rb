class Visitor < ApplicationRecord
  has_many :entries, as: :authorable

  validates :email, presence: true
  validates :email, uniqueness: true

end
