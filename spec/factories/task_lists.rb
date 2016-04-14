# == Schema Information
#
# Table name: task_lists
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :task_list do
    title "MyString"
  end
end
