require 'rubygems/command'

class Gem::Commands::DumpCommand < Gem::Command

  def initialize
    super 'dump', 'dump a list of rubygems formatted as gem install <gemname> <version>'
  end

  def execute
    sudo = options[:args].delete('sudo') || ''
    args = options[:args].map do |arg| 
      "--#{arg}" 
    end.join(' ')

    gems =  Gem.source_index.gems.values
    gems.each do |gem|  
      say "#{sudo} gem install #{gem.name} --version #{gem.version} #{args}"
    end
  end
end
