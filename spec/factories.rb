Factory.define :admin do |f|
  f.sequence(:email) { |n| "admin#{n}@example.com"}
  f.password "secret"
end