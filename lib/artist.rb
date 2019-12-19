class Artist
  attr_reader :id
  attr_accessor :artist_name, :stage_name

  def initialize(id = nil, artist_name, stage_name)
    @id = id || @@total_rows += 1
    @artist_name = artist_name
    @stage_name = stage_name
  end

  def stage
    Stage.find(self.stage_name)
  end

  def self.find_by_stage(stage_name)
  artists = []
  @@artists.values.each do |artist|
    if artist.stage_name == stage_name
      artists.push(artist)
    end
  end
  artists
end

  def save
    @@artists[self.id] = self
  end

  def update(artist_name)
    @artist_name = artist_name
  end

  def delete
    @@artists.delete(@id)
  end



# class methods
  @@artists = {}
  @@total_rows = 0

  def self.clear
    @@artists = {}
    @@total_rows = 0
  end

  def self.all
    @@artists.values
  end


end
