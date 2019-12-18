require 'rspec'
require 'stage'
require 'artist'
require 'pry'

describe 'Stage' do
  before(:each) do
    Stage.clear()
    @stage1 = Stage.new("Sequoia").save
    @stage2 = Stage.new("Aspen").save
    @stage3 = Stage.new("Hemlock").save

  end
  describe ('.all') do
    it ('returns an empty array when there are no stages')do
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe ('#save') do
    it('saves a stage') do
      stage4 = Stage.new(nil, "Fir").save
      expect(Stage.all).to(eq([@stage1, @stage2, @stage3, stage4]))
    end
  end

  describe ('#update') do
    it('updates the name of the stage') do
      @stage3.update("Alder")
      expect(@stage3.stage_name).to(eq("Alder"))
    end
  end

  describe ('#delete') do
    it('deletes a stage from the hash') do
      @stage3.delete
      expect(Stage.all).to(eq([@stage1, @stage2]))
    end
  end


end
