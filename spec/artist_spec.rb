require 'rspec'
require 'artist'
require 'artist'
require 'pry'

describe 'Artist' do
  before(:each) do
    Artist.clear()
    @artist1 = Artist.new(nil, "Michael Jackson", "Elm").save
    @artist2 = Artist.new(nil, "Pavorati", "Oak").save
    @artist3 = Artist.new(nil, "Kenny G", "Maple").save

  end
  describe ('.all') do
    it ('returns an empty array when there are no artists')do
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe ('#save') do
    it('saves a artist') do
      artist4 = Artist.new(nil, "Queen").save
      expect(Artist.all).to(eq([@artist1, @artist2, @artist3, artist4]))
    end
  end

  describe ('#update') do
    it('updates the name of the artist') do
      @artist3.update("Michael Bolton")
      expect(@artist3.artist_name).to(eq("Michael Bolton"))
    end
  end

  describe ('#delete') do
    it('deletes a artist from the hash') do
      @artist3.delete
      expect(Artist.all).to(eq([@artist1, @artist2]))
    end
  end
  describe('.find_by_stage') do
  it("finds artists for a stage") do
    stage2 = Stage.new(nil, "Poplar").save
    artist = Artist.new(nil, "Cake", @stage_name).save
    artist2 = Artist.new(nil, "California", stage2.id).save
    expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
  end
end

describe('#artists') do
it("returns an album's songs") do
  stage2 = Stage.new(nil, "Poplar").save
  artist = Artist.new(nil, "Cake", stage2.id).save
  artist2 = Artist.new(nil, "California", stage2.id).save
  expect(stage2.artists).to(eq([artist, artist2]))
end
end


end
