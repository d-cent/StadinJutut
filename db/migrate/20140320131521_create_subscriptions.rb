class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.text :terms, array: true, default: []
      t.text :email
      t.text :hashed_id

      t.timestamps
    end
  end
end
