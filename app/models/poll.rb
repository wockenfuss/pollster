class Poll < ActiveRecord::Base
  attr_accessible :admin_link, :link, :name
  has_many :questions

  validates :name, :admin_link, presence: true
  validates :admin_link, uniqueness: true

  def to_param
  	admin_link
  end
  
end
