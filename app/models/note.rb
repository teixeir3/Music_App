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
  attr_accessible :text, :user_id, :track_id

  validates :text, :user_id, :track_id, presence: true

  belongs_to(
    :track,
    :class_name => 'Track',
    :foreign_key => :track_id,
    :primary_key => :id
  )

  belongs_to(
    :user,
    :class_name => 'User',
    :foreign_key => :user_id,
    :primary_key => :id
  )
end
