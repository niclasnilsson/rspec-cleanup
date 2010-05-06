require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "with rspec-cleanup, it-blocks within a describe-block" do
  # This is the magic phrase that removes created classes and 
  # constants that might otherwise leak to other specs
  
  cleanup.after_spec
  
  before do
    class Computer
    end
  end
  
  it "should see classes defined in before blocks" do
    Computer.new
  end
  
  it "should see classes defined within the it-block itself" do
    class Mouse
    end
    
    Mouse.new
  end
  
  it "should not see classes defined in other it-blocks" do
    lambda { Mouse }.should raise_error
  end
end

describe "it-blocks within another describe block" do
  it "should not see classes defined in a before block of another describe block" do
    lambda { Computer }.should raise_error
  end
  
  it "should not see classes defined in an it block in another describe block" do
    lambda { Computer }.should raise_error
  end
end


