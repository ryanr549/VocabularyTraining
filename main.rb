#!/home/ryanr/.rvm/rubies/ruby-3.1.2/bin/ruby
class TrainingPlan
  def initialize()
    @groups = 6
    @intensity = 10
    puts `figlet Word List`
    print "How many groups do you want?(default 6) --"
    gets { |v|
      unless v.chomp.empty? then @groups = v.chomp end
    }
    print "How many words in a single group?(default 10) --"
    gets { |v|
      unless v.chomp.empty? then @intensity = v.chomp end
    }
  end

  def printout()
    puts "groups: #@groups"
    puts "intensity: #@intensity"
  end
end

Weekly = TrainingPlan.new
Weekly.printout
