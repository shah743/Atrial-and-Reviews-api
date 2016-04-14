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

class TaskList < ApplicationRecord
  validates :user_id, :title, presence: true

  belongs_to :user
  has_many   :tasks
end
