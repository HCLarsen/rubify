# rubify by Chris Larsen
#
# Runs through a ruby file, and changes all tabs to double spaces.

require 'fileutils'
require 'byebug'

files = []
@count = 0

def rubify_file(filename)
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
        if char == "\t"
          @count += 1
          char = "  "
        end
        temp_file.print char
      end
    end
    temp_file.close
    FileUtils.mv(temp_file, filename)

  else
    puts "File #{filename} doesn't exist"
  end
end

if ARGV.empty?
  Dir['**/**'].each { |file| files << file if File.file?(file) }
else
  ARGV.each do |arg|
    if File.file? arg
      files << arg
    elsif File.directory? arg
      path = arg + "/**/**"
      Dir[path].each { |file| files << file if File.file?(file) }
    elsif File.directory?(Dir.home + "/" + arg)
      path = Dir.home + "/" + arg + "/**/**"
      Dir[path].each { |file| files << file if File.file?(file) }
    end
  end
end

files.each { |file| rubify_file(file)}
puts "#{@count} tabs found and replaced"
