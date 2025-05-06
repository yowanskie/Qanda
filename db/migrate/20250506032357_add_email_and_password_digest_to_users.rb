class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    # Only add the columns if they don't already exist
    add_column :users, :password_digest, :string unless column_exists?(:users, :password_digest)
    add_column :users, :email, :string unless column_exists?(:users, :email)
  end
end
