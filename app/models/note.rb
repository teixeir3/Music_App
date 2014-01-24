# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  text       :string(255)      not null
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  # attr_accessible :title, :body
end
