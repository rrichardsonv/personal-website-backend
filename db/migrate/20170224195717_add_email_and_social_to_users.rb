class AddEmailAndSocialToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :email, :string, null: false)
    add_column(:users, :github, :string)
    add_column(:users, :twitter, :string)
    add_column(:users, :linkedin, :string)
  end
end
