require './app/models/concerns/slugifiable'
require './app/models/concerns/findable'

class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  extend Findable::ClassMethods

  belongs_to :artist
  has_and_belongs_to_many :genres

  

  

end