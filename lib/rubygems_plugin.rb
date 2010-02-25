require 'rubygems/command'
require 'rubygems_dump'

class Gem::Commands::DumpCommand < Gem::Command

  def initialize
    super 'dump', 'dump a list of rubygems formatted as gem install <gemname> <options>'
  end

  def execute
    `gem list`.each do |gem|  
      gem =~ /([\w-]+) \(([^)]+)\)/
      name = $1
      $2.split(",").each do |version| 
        puts "gem install #{name} --version #{version} #{options}"
      end
    end
  end
end
