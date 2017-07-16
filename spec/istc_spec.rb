require 'istc'

describe "The ISTC class" do
  it "should identify a valid ISTC" do
    expect(ISTC.new("0A9200112C4F1324").valid?).to be_truthy
  end

  it "should identify a valid ISTC" do
    expect(ISTC.valid?("0A9200112C4F1324")).to be_truthy
  end
  
  it "should identify an invalid ISTC" do
    expect(ISTC.valid?(nil)).to       be_falsey
    expect(ISTC.valid?("902865")).to  be_falsey
    expect(ISTC.valid?(Array)).to     be_falsey
    expect(ISTC.valid?(Array.new)).to be_falsey
    expect(ISTC.valid?("0A9200800000007B")).to  be_falsey
    expect(ISTC.valid?("0A9200800000007")).to   be_falsey
  end

  it "should calculate a ISTC check digit correctly" do
    expect(ISTC.complete("0A9200112C4F132")).to eql("0A9200112C4F1324")
  end

  it "should hyphen a ISTC correctly" do
    expect(ISTC.new("0A9200112C4F1324").to_s).to eql("0A9-2001-12C4F132-4")
  end

  it "should return sections of an ISTC correctly" do
    expect(ISTC.new("0A9200112C4F1324").agency).to eql("0A9")
    expect(ISTC.new("0A9200112C4F1324").year).to eql("2001")
    expect(ISTC.new("0A9200112C4F1324").work).to eql("12C4F132")
    expect(ISTC.new("0A9200112C4F1324").check).to eql("4")
  end
end
