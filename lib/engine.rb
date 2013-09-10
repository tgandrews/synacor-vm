class SynacorVM::Engine
  attr_accessor :memory, :registers, :position
  
  def initialize(memory: [], debug: false)
    @memory = memory
    @registers = Array.new 8
    @debug = debug
    @position = 0
  end
  
  def run (no_of_steps: 0)
    if no_of_steps == 0
      end_of_memory = @memory.length
    else
      end_of_memory = no_of_steps
    end

    while @position < end_of_memory
      data = memory[@position]
      case data
      when SynacorVM::HALT
        p 'halt' if @debug
        break
      when SynacorVM::JMP
        p 'jmp' if @debug
        @jmpTo = memory[@position + 1]
        p 'new position ' + @jmpTo.to_s if @debug
        @position = @jmpTo
        next
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
