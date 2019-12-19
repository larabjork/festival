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


get('/stages/new') { erb(:stages_new) }

get('/stages/:id') do
    @stage = Stage.find(params[:id])
    erb(:stage)
end

get('/stages/:id/edit') do
  @stage = Stage.find(params[:id])
  erb(:stage_edit)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name])
  @stages = Stage.all
  erb(:stages)
end

delete('/stages/:id') do
    @stage = Stage.find(params[:id].to_i())
    @stage.delete
    @stages = Stage.all
    erb(:stages)
end

get('/stages/:id/artists/:artist_name') do
  @artist = Artist.find(params[:artist_name])
  erb(:artist_name)
end

post('/stages/:id/artists') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.new(params[:artist_name], @stage.id, nil)
  artist.save()
  erb(:stage)
end

patch('/stages/:id/artists/:artist_name') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.find(params[:artist_name])
  artist.update(params[:artist_name], @stage.id)
  erb(:stage)
end

delete('/stages/:id/artists/:artist_name') do
  artist = Artist.find(params[:artist_name])
  artist.delete
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end


# patch('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   if params[:album_name] != ""
#     @album.update_name(params[:album_name])
#   end
#   if params[:year] != ""
#     @album.update_year(params[:year])
#   end
#   if params[:artist_name] != ""
#     @album.update_artist(params[:artist_name])
#   end
#   @albums = Album.all
#   erb(:albums)
# end
