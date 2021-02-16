class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  

  post '/songs' do
    Song.exists?(name: params[:song][:name]) ? (erb :'/songs/show') : @song = Song.create(params[:song])
    Artist.exists?(name: params[:artist][:name]) ? @song.artist = Artist.find_by(name: params[:artist][:name]) : @song.artist = Artist.create(params[:artist])
    params[:song_genre][:genre_ids].each do |genre|
      @song.genres << Genre.find(genre)
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end
end