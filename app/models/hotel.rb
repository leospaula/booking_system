class Hotel < ActiveRecord::Base
  belongs_to :owner
  
  validates_presence_of :name, :description
end
