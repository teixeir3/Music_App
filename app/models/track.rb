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
  attr_accessible :album_id, :title, :live, :lyrics, :ord

  validates :album_id, :title, :live, presence: true


  belongs_to(
    :album,
    :class_name => 'Album',
    :foreign_key => :album_id,
    :primary_key => :id
  )

  has_many(
    :notes,
    :class_name => 'Note',
    :foreign_key => :track_id,
    :primary_key => :id,
    :dependent => :destroy
  )
end
