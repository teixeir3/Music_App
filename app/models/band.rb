# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  attr_accessible :name

  validates :name, :uniqueness => true, presence: true

  has_many(
    :albums,
    :class_name => 'Album',
    :foreign_key => :band_id,
    :primary_key => :id,
    :dependent => :destroy
  )

end
