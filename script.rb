debug = (ARGV[0] == 'debug')

file = File.new 'challenge.bin', 'rb'

memory = Array.new
registers = Array.new 8

# 2 passes, but sorts out the data
while packed_data = file.read(2)
  data = packed_data.unpack('v').first
  memory << data
end

position = 0
total_size = memory.length
while position < total_size
  data = memory[position]
  case data
  when 0
    p 'halt' if debug
    break
  when 19
    p 'out' if debug
    position = position + 1
    character = memory[position]
    p character if debug
    print character.chr
  when 21
    p 'no-op' if debug
    position = position + 1
    next
  end
  position += 1
end