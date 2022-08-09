#!/home/ryanr/.rvm/rubies/ruby-3.1.2/bin/ruby
class TrainingPlan
  def initialize(groups, intens, fname)
    @groups = groups.to_i
    @intensity = intens.to_i
    @filename = fname
    @template = File.new("./template.tex", "r").read
    @f = File.new(@filename, "w+")
  end

  def printout
    puts "groups: #@groups"
    puts "intensity: #@intensity"
    puts "totalL: #{@groups * @intensity}"
    puts "written into: #@filename"
  end

  def write
    head = @template[..@template.index("\n\\end{multicols}")]
    @f.puts head
    for group in 1..@groups
      print "Group name: ".ljust(20)
      group_name = gets.chomp
      @f.puts "\\begin{textbox}{#{group_name}}\n\\begin{itemize}"
      for item in 1..@intensity
        #TODO: create tex blocks
        print "Word:".ljust(20)
        word = gets.chomp
        print "Word Class:".ljust(20)
        wc = gets.chomp
        print "Chinese Meaning".ljust(20)
        meaning = gets.chomp
        @f.puts "\\item #{word} \\emph{#{wc}\.#{meaning}}"
      end
      @f.puts "\\end{itemize}\n\\end{textbox}"
    end
    @f.puts "\\end{multicols}\n\\end{document}"
    @f.close
  end
end

# Initialization
puts `figlet Word List`
print "How many groups do you want?(default 6) --".ljust(50)
groups = gets.chomp
if groups.empty? then groups = 6 end
print "How many words in a single group?(default 10) --".ljust(50)
intens = gets.chomp
if intens.empty? then intens = 10 end
print "Input filename -- ".ljust(50)
filename = gets.chomp
if filename.empty? then filename = `date +%F`.chomp end
filename += ".tex"
Weekly = TrainingPlan.new(groups, intens, filename)
Weekly.printout
Weekly.write
