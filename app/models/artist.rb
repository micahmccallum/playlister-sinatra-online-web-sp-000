class Artist < ActiveRecord::Base
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

  def slug
    Slugifiable.slugify(self.name)    
  end

  def self.find_by_slug(slug)
    artist_name = Slugifiable.deslugify(slug)
    Artist.find_by(name: "#{artist_name}")
  end  
end