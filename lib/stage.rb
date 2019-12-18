class Stage
  attr_reader :id
  attr_accessor :stage_name

  def initialize(id, stage_name)
    @id = id || @@total_rows += 1
    @stage_name = stage_name
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
