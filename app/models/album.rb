# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  title      :string(255)      not null
#  year       :date             not null
#  live       :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  attr_accessible :band_id, :title, :year, :live

  validates :band_id, :title, :year, :live, :presence => true

  belongs_to(
    :band,
    :class_name => 'Band',
    :foreign_key => :band_id,
    :primary_key => :id
  )

  has_many(
    :tracks,
    :class_name => 'Track',
    :foreign_key => :album_id,
    :primary_key => :id,
    :dependent => :destroy
  )
end
