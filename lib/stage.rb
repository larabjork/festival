class Stage
  attr_reader :id
  attr_accessor :stage_name

  def initialize(id = nil, stage_name)
    @id = id || @@total_rows += 1
    @stage_name = stage_name
  end

  def save
    @@stages[self.id] = self
  end

  def update(stage_name)
    @stage_name = stage_name
  end

  def delete
    @@stages.delete(@id)
  end

  def artists
  Artist.find_by_stage(self.id)
end



# class methods
  @@stages = {}
  @@total_rows = 0

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.all
    @@stages.values
  end


end
