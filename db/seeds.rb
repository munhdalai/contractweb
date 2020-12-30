# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..100).each do |i|
  default_register = "ТА890812"
  reglast_number = i > 9 ? "#{i}" : "0#{i}"
  default_register = default_register + reglast_number
  c = Contract.create!(number: Faker::IDNumber.valid, lastname: Faker::Name.last_name, firstname: Faker::Name.first_name, register: default_register, address: Faker::Address.full_address)
  x = rand(3)
  if x == 0
    c.document.attach(io: File.open(Rails.public_path.join("test_documents/file-sample_100kB.doc")), filename: "file-sample_100kB.doc", content_type: "application/msword")
  elsif x == 1
    c.document.attach(io: File.open(Rails.public_path.join("test_documents/file-sample_100kB.docx")), filename: "file-sample_100kB.docx", content_type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
  elsif x == 2
    c.document.attach(io: File.open(Rails.public_path.join("test_documents/SLK20R.pdf")), filename: "SLK20R.pdf", content_type: "application/pdf")
  else
  end
end