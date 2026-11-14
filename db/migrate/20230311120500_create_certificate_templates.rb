class CreateCertificateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificate_templates do |t|
      t.string :name, null: false
      t.jsonb :modifications, default: {}

      t.timestamps
    end
  end
end
