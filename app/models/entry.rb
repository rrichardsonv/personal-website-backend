class Entry < ApplicationRecord
  belongs_to :authorable, polymorphic: true
  validates :title, :body, presence: true
  has_one :project

  def visitor
    unless self.authorable_type == 'User'
      @visitor ||= Visitor.find_by(id: self.authorable_id)
    end
  end

  def visitor=(attributes)
    unless self.authorable_type == 'User'
      visitor = Visitor.find_by(email: attributes[:email])
      if !!visitor
        self.authorable_id = visitor.id
        self.authorable_type = 'Visitor'
      else
        visitor = Visitor.new(attributes)
        if visitor.save
          self.authorable_id = visitor.id
          self.authorable_type = 'Visitor'
        else
          false
        end
      end
    end
  end
end
