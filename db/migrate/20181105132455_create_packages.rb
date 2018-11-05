class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.timestamps
      t.timestamp :deleted_at
    end
  end
end
