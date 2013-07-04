#!/usr/bin/env ruby
#

require 'rake'

def compile wda
  wda.each do |wd|
    Dir.chdir( File.join(File.dirname(__FILE__), wd) ) do
      Dir.glob("*.tex").each do |f|
        sh "texi2pdf #{f}" do  |(ok,res)| 
          exit if not ok
        end
      end
    end
  end
end

task :default => [:compile]

desc 'Do all of the compilations'
task :compile do
  compile %w{presentations notes}
end

desc 'Populate DB'
task :populate do
  sh File.join(File.dirname(__FILE__), 'tools', 'db_up.rb')
end

namespace :compile do
  desc 'Do the presentations'
  task :presentations do
    compile %w{presentations}
  end

  desc 'Do the notes'
  task :notes do
    compile %w{notes}
  end
end
