#!/usr/bin/env ruby

# This script should be called from ~/dotfiles, not your homedir!

require 'fileutils'

dotfiles = `git ls-files .[a-z]*`.split
top_level_dotfiles = dotfiles.map{|path| path.gsub(/\/.*/, '') }.uniq

top_level_dotfiles.each do |file|
  puts "Creating symlink for #{file}"
  FileUtils.ln_s File.expand_path("../#{file}", __FILE__), File.expand_path("~/#{file}")
end
