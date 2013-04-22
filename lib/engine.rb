class SynacorVM::Engine
  attr_accessor :memory, :registers, :position
  
  def initialize(memory: [], debug: false)
    @memory = memory
    @registers = Array.new 8
    @debug = debug
    @position = 0
  end
  
  def run
    end_of_memory = @memory.length
    while @position < end_of_memory
      data = memory[@position]
      case data
      when SynacorVM::HALT
        p 'halt' if @debug
        break
      when SynacorVM::OUT
        p 'out' if @debug
        @position = @position + 1
        character = memory[@position]
        p character if @debug
        p character.chr if @debug
        print character.chr
      when SynacorVM::NOOP
        p 'no-op' if @debug
        @position = @position + 1
        next
      end
      @position += 1
    end
  end
end
