require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), '..', 'lib', 'atmos')

describe Atmos do
  context "Create an empty object" do
    
    before do
      @id = Atmos::Object.create
    end
    
    it "should return an ID" do
      @id.should_not be_nil
    end
    
    it "should read back the content" do
      o = Atmos::Object.read(@id)
      o.should eql ""
    end

  end
end