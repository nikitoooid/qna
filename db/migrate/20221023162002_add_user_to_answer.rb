class AddUserToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :user, foreign_key: true, null: false
  end
end
