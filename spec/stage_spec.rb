require 'rspec'
require 'stage'
require 'artist'
require 'pry'

describe 'Stage' do
  describe ('.all') do
    it ('returns an empty array when there are no stages')do
      Stage.clear
      expect(Stage.all).to(eq([]))
  end
end




end
