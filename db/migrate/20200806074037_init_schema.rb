class InitSchema < ActiveRecord::Migration[5.1]
  def up
    create_table 'children', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string 'name'
      t.integer 'user_id'
      t.integer 'event_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
    create_table 'events', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string 'title'
      t.string 'text'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.string 'image'
      t.string 'date'
      t.integer 'user_id'
    end
    create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string 'email', default: '', null: false
      t.string 'encrypted_password', default: '', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.string 'image'
      t.string 'name'
      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 'The initial migration is not revertable'
  end
end
