class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |user|
      user.string :Username 
      user.string :Password
  end
end
