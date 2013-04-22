require 'test/unit'
require_relative '../lib/vm.rb'

class VMOperationsTest < Test::Unit::TestCase
  def initalize
    @registers = Array.new 8
  end
  
  def test_noop
    memory = ([] << SynacorVM::NOOP)
    vm = SynacorVM::Engine.new(memory: memory)
    assert_equal vm.position, 0
    vm.run
    assert_equal vm.position, 1
  end
    
end