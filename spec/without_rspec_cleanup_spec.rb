describe "in rspec, it-blocks within a describe-block" do
  before do
    class Person
    end
  end
  
  it "can see classes defined in before blocks" do
    Person.new
  end
  
  it "can see classes defined within the it-block itself" do
    class Address
    end
    
    Address.new
  end
  
  it "can see classes defined in other it-blocks" do
    Address.new
  end
end

describe "it-blocks within another describe block, even in other files" do
  it "can see classes defined in a before block of another describe block" do
    Person.new
  end
  
  it "can see classes defined in an it block in another describe block" do
    Address.new
  end
end

