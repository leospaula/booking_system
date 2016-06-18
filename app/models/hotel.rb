class Hotel < ActiveRecord::Base
  belongs_to :owner
  has_many :rooms
  
  validates_presence_of :name, :description
end
