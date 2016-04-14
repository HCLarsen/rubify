# rubify by Chris Larsen
#
# Runs through a ruby file, and changes all tabs to double spaces.

require 'strscan'
require 'byebug'

filename = 'test.rb'
count = 0

if File.file? filename
  if !File.readable?(filename)
    puts "File #{filename} is not readable"
    exit
  end
  if !File.writable?(filename)
    puts "File #{filename} is not writable"
    exit
  end
  @file = File.read(filename)

  COMMENT = /#/
  TAB = /\t/
  SPACES = "  "

  s = StringScanner.new(@file)

  until s.eos?
    if s.scan(TAB)
      puts "tab found"
      count += 1
      # replace the tab with the SPACES string
    elsif s.scan(COMMENT)
      s.skip_until(/\n/)
    else
      s.getch
    end
  end
  puts "#{count} tabs found"
else
  puts "File #{filename} doesn't exist"
end
