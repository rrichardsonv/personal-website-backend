class AddPolymorphicToEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column(:entries, :author_id, :integer)
    add_reference(:entries, :authorable, polymorphic: true, index: true, null: false)
  end
end
