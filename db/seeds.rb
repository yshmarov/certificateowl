# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CertificateTemplate.create(
  name: 'Certificate of completion',
  modifications: {
    name: "Peter Parker",
    description: "for completing the spiderman 101 course",
    issued_at: "11 March 2023",
    issued_by: "Yaroslav Shmarov"
  }
)

CertificateTemplate.create(
  name: 'Employee of the month',
  modifications: {
    name: "Tom Baker",
    description: "fastest employee service",
    issued_at: "11 March 2023",
    issued_by: "Yaroslav Shmarov"
  }
)
