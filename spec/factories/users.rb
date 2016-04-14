# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  api_key    :string
#

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    role 1
  end
end
