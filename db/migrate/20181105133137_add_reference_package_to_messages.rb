class AddReferencePackageToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :package, type: :uuid, foreign_key: true
  end
end
