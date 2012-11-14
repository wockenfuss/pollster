class Poll < ActiveRecord::Base
  attr_accessible :admin_link, :link, :name
  has_many :questions

  validates :name, :admin_link, :link, presence: true
  validates :admin_link, :link, uniqueness: true
end
