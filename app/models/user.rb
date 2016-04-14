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

class User < ApplicationRecord
  validates :name, :role,presence: true
  validates :api_key, uniqueness: true

  has_many :task_lists

  enum role: [:admin, :user]

  # Assign an API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end
end
