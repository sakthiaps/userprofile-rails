class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
      t.text :password_digest, null: false
      t.timestamp :password_reset_requested
      t.boolean :status, default: true
      t.timestamp :last_login
      t.text :last_login_ip, default: '0.0.0.0', null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email
  end
end
