require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/artist')

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
