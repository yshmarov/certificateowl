class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.jsonb :modifications, default: {}
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
