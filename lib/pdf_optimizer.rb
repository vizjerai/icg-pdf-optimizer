#
# Wrapper around pdfsizeopt
class PdfOptimizer
  attr_accessor :file_path, :filename, :pdfsizeopt
  attr_accessor :output_path
  attr_accessor :thumbnail_width

  def initialize(file_path, filename = nil)
    @file_path = file_path
    @filename = filename || File.basename(file_path, File.extname(file_path))
    @output_path = 'output'
    @pdfsizeopt = './vendor/pdfsizeopt.single'
    @thumbnail_width = 230
  end

  def optimize
    require 'open3'
    output_filename = File.join(output_path, filename + '.pdf')

    command = "#{pdfsizeopt} --use-multivalent=false #{file_path} #{output_filename}"

    ::Open3.popen3(command) do |_stdin, _stout, stderr, wait_thr|
      if wait_thr.value.success?
        puts "Generated: #{output_filename}"
      else
        puts stderr.read
      end
    end
  end

  def generate_thumbnail
    require 'rmagick'
    output_filename = File.join(output_path, filename + '.jpg')

    image = ::Magick::Image.read(file_path)[0]
    image.resize_to_fit!(thumbnail_width)

    puts "Generated: #{output_filename}" if image.write(output_filename)
  end
end
