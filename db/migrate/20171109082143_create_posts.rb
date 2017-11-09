class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :noun
      t.references :adjective, foreign_key: true
      t.references :verb, foreign_key: true
      t.references :recipient

      t.timestamps
    end
    add_foreign_key :posts, :users, column: :noun_id, primary_key: :id
    add_foreign_key :posts, :users, column: :recipient_id, primary_key: :id
  end
end
