#!/usr/bin/env ruby
#

require 'rake'

def compile wda
  wda.each do |wd|
    Dir.chdir( File.join(File.dirname(__FILE__), wd) ) do
      sh "texi2pdf *.tex"
    end
  end
end

task :default => [:compile]

desc 'Do all of the compilations'
task :compile do
  compile %w{presentations notes}
end

namespace :compile do
  desc 'Do the presentations'
  task :presentations do
    compile %w{presentations}
  end

  desc 'Do the notes'
  task :notes do
    compile %{notes}
  end
end
