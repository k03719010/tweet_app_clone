class AddUseridToPosts < ActiveRecord::Migration[6.0]
  def change
    add_columun :posts, :user_id, :integer
  end
end
