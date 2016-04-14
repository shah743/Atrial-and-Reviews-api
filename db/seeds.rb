# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

[*1..3].map do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, role: 'admin')
end

[*1..10].map do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, role: 'user')
end

User.all.each do |user|
  [*1..3].map{user.task_lists.create(title: Faker::Hipster.sentence(3))}
end

TaskList.all.each do |task_list|
  task_list.tasks.create(title: Faker::Hipster.sentence(3), description: Faker::Hipster.sentences)
end