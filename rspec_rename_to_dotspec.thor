require 'ftools'

class Rspec < Thor
  desc "rename_to_dotspec", "Convert your *_spec.rb files to *.spec"
  def rename_to_dotspec
    dir = Dir.pwd
    spec_subdir = File.join(dir, 'spec')
    if File.directory?(spec_subdir)
      puts "Automatically limiting rename to the spec directory: #{spec_subdir}"
      dir = spec_subdir
    end
    pattern = File.join(dir, '**/*_spec.rb')
    print "Processing #{pattern}... "
    STDOUT.flush
    count = Dir.glob(pattern).each do |file|
      new_file = file.gsub(/_spec\.rb$/, '.spec')
      File.move(file, new_file)
    end.size
    puts "#{count} files renamed."
  end

  desc "rename_from_dotspec", "Convert your *.spec files to *_spec.rb"
  def rename_from_dotspec
    dir = Dir.pwd
    spec_subdir = File.join(dir, 'spec')
    if File.directory?(spec_subdir)
      puts "Automatically limiting rename to the spec directory: #{spec_subdir}"
      dir = spec_subdir
    end
    pattern = File.join(dir, '**/*.spec')
    print "Processing #{pattern}... "
    STDOUT.flush
    count = Dir.glob(pattern).each do |file|
      new_file = file.gsub(/\.spec$/, '_spec.rb')
      File.move(file, new_file)
    end.size
    puts "#{count} files renamed."
  end
end
