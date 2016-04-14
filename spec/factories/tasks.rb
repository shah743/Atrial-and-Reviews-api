# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  task_list_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
  end
end
