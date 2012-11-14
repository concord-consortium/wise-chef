#!/usr/bin/env ruby
#Make a tarball of only the recipes called in dna.json
#Takes as an argument the path to a Vagrant VM's folder.
require 'rubygems'
require 'json'

class EC2Packager

  def initialize(_path=".")
    @root_dir = File.expand_path(_path)
    # self.generate_dna_files  # TODO:  WE are skipping this
  end

  def cookbook_directory
    path("cookbooks")
  end

  def cookbook_archive_file
    "#{cookbook_directory}.tgz"
  end

  def dna_file
    path('dna.json')
  end

  def cookbooks_json_path
   path('.cookbooks_path.json')
  end

  def create_tarfile
    cd do
      # hack to make tarfile use relative paths ..
      dir = cookbook_directory.gsub(@root_dir,'').gsub(/^\//,'')
      tar_command = "tar czf #{cookbook_archive_file} #{dir} 2> /dev/null"
      %x[#{tar_command}]
    end
  end

  protected
  
  def path(filename)
    File.join(@root_dir,filename)
  end

  # First modify the VagrantFile according to instructions here: https://github.com/lynaghk/vagrant-ec2
  # use the Vagrant file to configure cookbooks
  def generate_dna_files
    cd do
      # run vagrant to parse the `Vagrantfile` and write out `dna.json` and `.cookbooks_path.json`.
      results = %x[vagrant]
      if $?.exitstatus != 0
        puts "failed to run vagrant: #{results}"
        exit 1
      end
      @cookbook_paths = [JSON.parse(open(cookbooks_json_path).read)].flatten
      @recipe_names = JSON.parse(open(dna_file).read)["run_list"]
      @recipe_names.map! { |file_name|
        file_name.gsub('recipe', '').gsub(/(\[|\])/, '').gsub(/::.*$/, '')
      }
      @recipe_names.uniq!
    end
  end

  def cd
    Dir.chdir @root_dir do
      yield
    end
  end

end

