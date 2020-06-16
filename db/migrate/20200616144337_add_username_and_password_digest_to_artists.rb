class AddUsernameAndPasswordDigestToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :username, :string
    add_column :artists, :password_digest, :string
  end
end
