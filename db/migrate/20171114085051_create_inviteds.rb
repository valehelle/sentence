class CreateInviteds < ActiveRecord::Migration[5.1]
  def change
    create_table :inviteds do |t|
      t.string :email

      t.timestamps
    end
  end
end
