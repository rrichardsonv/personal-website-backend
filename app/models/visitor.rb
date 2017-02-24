class Visitor < ApplicationRecord
  has_many :entries, as: :authorable
end
