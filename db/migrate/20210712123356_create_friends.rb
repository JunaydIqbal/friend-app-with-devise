class CreateFriends < ActiveRecord::Migration[6.1]
  def up
    create_table :friends do |t|
      t.string :first_name 
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :twitter

      t.timestamps
    end
  end

  def def down 
    drop_table :friends
  end
end
