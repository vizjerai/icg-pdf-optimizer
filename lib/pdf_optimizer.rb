class PdfOptimizer
  attr_accessor :filename, :pdfsizeopt
  attr_accessor :output_filename

  def initialize(filename, output_filename = nil)
    @filename = filename
    @output_filename = output_filename || "output/#{filename}"
    @pdfsizeopt = './vendor/pdfsizeopt.single'
  end

  def optimize
    exec "#{pdfsizeopt} --use-multivalent=false #{filename} #{output_filename}"
  end
end
