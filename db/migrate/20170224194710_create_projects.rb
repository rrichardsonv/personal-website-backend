class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :stack
      
      t.string :visual_url
      t.string :visual_type

      t.string :repo_url
      t.string :website_url
      t.integer :entry_id

      t.timestamps
    end
  end
end
