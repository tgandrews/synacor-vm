file = File.new 'challenge.bin', 'rb'

registers = Array.new 8

while packed_data = file.read(2)
  data = packed_data.unpack('v').first
  # p data
  case data
  when 0
    p 'halt'
  when 19
    p 'out'
  when 21
    p 'no-op'
  end
end
