# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

admin = Admin.create(:email => 'admin@somesite.com', :password => 'secret', :password_confirmate => "secret")

Admin.confirm_by_token(admin.confirmation_token)
