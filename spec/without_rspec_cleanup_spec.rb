describe "in rspec, it-blocks within a describe-block" do
  before do
    class ClassDefinedInBeforeBlockWithoutCleanup
    end
  end
  
  it "can see classes defined in before blocks" do
    ClassDefinedInBeforeBlockWithoutCleanup.new
  end
  
  it "can see classes defined within the it-block itself" do
    class ClassDefinedInItBlockWithoutCleanup
    end
    
    ClassDefinedInItBlockWithoutCleanup.new
  end
  
  it "can see classes defined in other it-blocks" do
    ClassDefinedInItBlockWithoutCleanup.new
  end
end

describe "it-blocks within another describe block" do
  it "can see classes defined in a before block of another describe block" do
    ClassDefinedInBeforeBlockWithoutCleanup.new
  end
  
  it "can see classes defined in an it block in another describe block" do
    ClassDefinedInItBlockWithoutCleanup.new
  end
end

