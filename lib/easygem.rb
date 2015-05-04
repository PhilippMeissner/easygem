#!/usr/bin/ruby

class EasyGem
  def self.update
    # Remember original directory
    orig_dir = Dir.pwd
    # Iterate over all directories
    Dir.foreach(orig_dir) do |entry|
      if ((File.directory?(entry)) && (!File.file?(entry)) && (entry != '.') && (entry != '..'))
        # Go into directory
        Dir.chdir(entry)
        # Update repository
        system("git pull")
        # Change back to original directory
        Dir.chdir(orig_dir)
      end
    end
  end
end
