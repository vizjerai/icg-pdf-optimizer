# brew install python
# brew install ghostscript

# ./pdfsizeopt.single --use-multivalent=false <input.pdf>
# creates <input.pso.pdf>

class PdfOptimizer
  attr_accessor :filename, :pdfsizeopt

  def initialize(filename)
    @filename = filename
    @pdfsizeopt = './vendor/pdfsizeopt.single'
  end

  def optimize
    exec "#{pdfsizeopt} --use-multivalent=false #{filename}"
    # exec "#{pdfsizeopt} --use-multivalent=false #{input_file}"
  end
end
