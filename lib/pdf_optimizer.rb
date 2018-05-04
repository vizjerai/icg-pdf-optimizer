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

    command = "#{pdfsizeopt} --use-multivalent=false --use-image-optimizer=pngwolf #{file_path} #{output_filename}"

    puts "Optimizing PDF"
    ::Open3.popen3(command) do |_stdin, _stout, stderr, wait_thr|
      if wait_thr.value.success?
        puts "  Generated: #{output_filename}"
      else
        puts stderr.read
      end
    end
  end

  def generate_thumbnail
    require 'mini_magick'
    image_format = 'jpg'
    output_filename = File.join(output_path, "#{filename}.#{image_format}")

    puts "Generating Thumbnail"
    image = ::MiniMagick::Image.open(file_path)
    image.format(image_format)
    image.resize(thumbnail_width)
    image.write(output_filename)
    puts "  Generated: #{output_filename}"
  end
end
