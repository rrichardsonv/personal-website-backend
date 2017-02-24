class Entry < ApplicationRecord
  belongs_to :authorable, polymorphic: true
  validates :title, :body, presence: true
end
