require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/artist')

get('/') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages') do
  @stages = Stage.all
  erb(:stages)
end

post('/stages') do
  @stage = Stage.new(*params.values).save 
  @stages = Stage.all
  erb(:stages)
end

patch('/stages/:id') do
  @stage = Stage.
end



patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  if params[:album_name] != ""
    @album.update_name(params[:album_name])
  end
  if params[:year] != ""
    @album.update_year(params[:year])
  end
  if params[:artist_name] != ""
    @album.update_artist(params[:artist_name])
  end
  @albums = Album.all
  erb(:albums)
end
