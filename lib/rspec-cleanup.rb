module Kernel
  alias_method :cleanup, :binding
end

class Binding
  def after_spec
    
    eval 'before do
      mod = Object
      @_constants_before_spec_ = mod.constants
    end
    '
    
    eval 'after do  
      mod = Object
      constants_to_remove = mod.constants - @_constants_before_spec_

      # puts "Will remove constants: #{constants_to_remove.inspect}"
      constants_to_remove.each { |const| mod.send(:remove_const, const) }
    end
  '
  end
end
