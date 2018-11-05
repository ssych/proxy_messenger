class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :data, null: false
      t.string :user_id, null: false
      t.string :provider, null: false
      t.string :state, null: false

      t.timestamps
      t.timestamp :deleted_at
    end
  end
end
