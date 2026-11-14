class AddSlugToCertificates < ActiveRecord::Migration[7.0]
  def change
    add_column :certificates, :slug, :string
    add_index :certificates, :slug, unique: true
  end
end
