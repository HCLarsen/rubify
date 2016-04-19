number = ARGV.first.to_i

number.times do | num |
  File.open("test" + num.to_s, "w") do |file|
    file.puts "# Test file for rubify"
    file.puts ""
    file.puts "class TestClass"
    file.puts "  def initialize"
    file.puts "\t\t@string1 = 'This is a string'"
    file.puts "\t\t@string2 = 'This is also a string'"
    file.puts "    @string3 = 'This is a third string'"
    file.puts "\tend"
    file.puts "end"

    puts file
  end
end
