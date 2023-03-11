class CsvImportService
  require 'csv'
  
  attr_reader :file, :group

  def initialize(file:, group_id:)
    @file = file
    @group = Group.find(group_id)
  end

  def call

    opened_file = File.open(file)
    options = { headers: true, col_sep: ';' }
    CSV.foreach(opened_file, **options) do |row|
      certificate_hash = {}
      certificate_hash[:name] = row['name']
      certificate_hash[:email] = row['email']
      # TODO: store dynamic modification columns in one hash
      modifications = {}
      modifications[:name] = row['modifications.name']
      modifications[:description] = row["modifications.description"]
      modifications[:issued_at] = row['modifications.issued_at']
      modifications[:issued_by] = row['modifications.issued_by']

      certificate_hash[:modifications] = modifications
      
      certificate = group.certificates.find_or_create_by!(certificate_hash)
    end
  end
end