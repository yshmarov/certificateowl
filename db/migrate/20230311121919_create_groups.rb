class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :certificate_template, null: false, foreign_key: true
      t.boolean :display_qr, default: false
      t.boolean :display_verify_link, default: false
      t.boolean :display_cert_id, default: false
      t.boolean :email, default: false

      t.timestamps
    end
  end
end
