# rubify by Chris Larsen
#
# Runs through a ruby file, and changes all tabs to double spaces.

require 'fileutils'
require 'byebug'

#filename = ARGV.first

def rubify_file(filename)
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

    temp_file = File.open(filename + ".tmp", "w")
    File.open(filename) do | file |
      file.each_char do | char |
        # print char
        if char == "\t"
          count += 1
          char = "  "
        end
        temp_file.print char
      end
    end
    temp_file.close
    FileUtils.mv(temp_file, filename)

    puts "#{count} tabs found and replaced"
    puts File.read(filename)
  else
    puts "File #{filename} doesn't exist"
  end
end

ARGV.each { |file| rubify_file(file)}
