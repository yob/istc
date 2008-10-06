$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'istc'

describe "The ISTC class" do
  it "should identify a valid ISTC" do
    ISTC.new("0A9200112C4F1324").valid?.should be_true
  end

  it "should identify a valid ISTC" do
    ISTC.valid?("0A9200112C4F1324").should be_true
  end
  
  it "should identify an invalid ISTC" do
    ISTC.valid?(nil).should       be_false
    ISTC.valid?("902865").should  be_false
    ISTC.valid?(Array).should     be_false
    ISTC.valid?(Array.new).should be_false
    ISTC.valid?("0A9200800000007B").should  be_false
    ISTC.valid?("0A9200800000007").should   be_false
  end

  it "should calculate a ISTC check digit correctly" do
    ISTC.complete("0A9200112C4F132").should eql("0A9200112C4F1324")
  end
end
