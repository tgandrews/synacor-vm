require 'test/unit'
require_relative '../lib/vm.rb'

class VMOperationsTest < Test::Unit::TestCase
  def initalize
    @registers = Array.new 8
  end
  
  def test_noop
    memory = ([] << SynacorVM::NOOP)
    vm = SynacorVM::Engine.new(memory: memory)
    assert_equal 0, vm.position
    vm.run
    assert_equal 1, vm.position
  end

  def test_jmp
    memory = []
    memory << SynacorVM::JMP
    memory << 4
    memory << SynacorVM::NOOP
    memory << SynacorVM::NOOP
    memory << SynacorVM::NOOP
    memory << SynacorVM::NOOP
    vm = SynacorVM::Engine.new(memory: memory)
    assert_equal 0, vm.position
    vm.run(no_of_steps: 1)
    assert_equal 4, vm.position
  end    
end