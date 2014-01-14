# This script should be called from ~/dotfiles, not your homedir!

require 'fileutils'

desc "Create symlinks for all versioned files in $HOME"
task :setup do
  dotfiles = `git ls-files .[a-z]*`.split
  top_level_dotfiles = dotfiles.map{|path| path.gsub(/\/.*/, '') }.uniq
  
  top_level_dotfiles.each do |file|
    dotfile = File.expand_path("~/#{file}")
    if File.exists?(dotfile)
      puts "Symlink #{dotfile} already exists, skipping"
    else
      puts "Creating symlink #{dotfile}"
      FileUtils.ln_s File.expand_path("../#{file}", __FILE__), dotfile
    end
  end
end
