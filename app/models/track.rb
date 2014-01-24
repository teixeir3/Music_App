# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string(255)      not null
#  live       :boolean          not null
#  lyrics     :string(255)
#  ord        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  # attr_accessible :title, :body
end
