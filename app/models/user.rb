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
end
