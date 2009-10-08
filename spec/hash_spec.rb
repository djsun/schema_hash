require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Hash do

  describe "calling #schema on a Hash" do
    before do
      @h = { :a => "a" }
      @h.schema = {} # value is arbitrary
      @h
    end
  
    it "should be Schemable" do
      @h.is_a?(Schemable).should be_true
    end

    it "should have #valid?" do
      @h.respond_to?(:valid?).should be_true
    end

    it "should have #schema" do
      @h.respond_to?(:schema).should be_true
    end
  end

end
