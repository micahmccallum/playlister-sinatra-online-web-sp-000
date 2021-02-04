require './app/models/concerns/slugifiable'
require './app/models/concerns/findable'

class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  extend Findable::ClassMethods
  has_many :artists, through: :songs
  has_and_belongs_to_many :songs

  
end