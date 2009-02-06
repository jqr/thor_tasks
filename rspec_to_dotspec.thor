require 'ftools'

class Rspec < Thor
  desc "to_dotspec", "Convert your *_spec.rb files to *.spec"
  def to_dotspec
    pattern = File.join(Dir.pwd, '**/*_spec.rb')
    puts "processing #{pattern}..."
    count = Dir.glob(pattern).each do |file|
      new_file = file.gsub(/_spec.rb$/, '.spec')
      File.move(file, new_file)
    end.size
    puts "#{count} files renamed."
  end
end
