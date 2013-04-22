require './lib/vm.rb'

debug = (ARGV[0] == 'debug')

file = File.new 'challenge.bin', 'rb'

memory = Array.new
registers = Array.new 8

# 2 passes, but sorts out the data
while packed_data = file.read(2)
  data = packed_data.unpack('v').first
  memory << data
end

vm = SynacorVM::Engine.new(memory: memory, debug: debug)
vm.run

puts ''