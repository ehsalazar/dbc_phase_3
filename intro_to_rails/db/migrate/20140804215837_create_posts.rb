class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :require => true
      t.text :body, :require => true

      t.timestamps
    end
  end
end
