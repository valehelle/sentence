class CreateAdjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :adjectives do |t|
      t.string :content

      t.timestamps
    end
  end
end
