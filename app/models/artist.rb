require './app/models/concerns/slugifiable'
require './app/models/concerns/findable'

class Artist < ActiveRecord::Base  
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  extend Findable::ClassMethods

  has_many :genres
  has_many :genres, through: :songs
  attr_accessor :songs, :genres
  attr_reader :id

  def songs
    Song.all.select{|song| song.artist_id == self.id}
  end

  def genres
    self.songs.select{ |song| song.genres }
  end  

end