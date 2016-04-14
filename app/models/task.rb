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

class Task < ApplicationRecord
  validates :title, :task_list_id, presence: true

  belongs_to :task_list
end
