require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Traversable do
  
  describe "#ref" do
    describe "simple hash" do
      before do
        @h = { :a => "a" }
        @h.extend Traversable
      end
    
      it "[]" do
        @h.ref([]).should == @h
      end
    
      it "[:x]" do
        @h.ref([:x]).should == nil
      end

      it "[:x, :y]" do
        @h.ref([:x, :y]).should == nil
      end
    
      it "[:a]" do
        @h.ref([:a]).should == @h[:a]
      end
    end
    
    describe "2 level hash" do
      before do
        @h = { :a => { :b => "b" } }
        @h.extend Traversable
      end
    
      it "[]" do
        @h.ref([]).should == @h
      end
    
      it "[:x]" do
        @h.ref([:x]).should == nil
      end

      it "[:x, :y]" do
        @h.ref([:x, :y]).should == nil
      end
    
      it "[:a]" do
        @h.ref([:a]).should == @h[:a]
      end
    
      it "[:a, :b]" do
        @h.ref([:a, :b]).should == @h[:a][:b]
      end
    end
    
    describe "3 level hash" do
      before do
        @h = { :a => { :b => { :c => "c" } } }
        @h.extend Traversable
      end
    
      it "[]" do
        @h.ref([]).should == @h
      end
    
      it "[:x]" do
        @h.ref([:x]).should == nil
      end

      it "[:x, :y]" do
        @h.ref([:x, :y]).should == nil
      end
    
      it "[:a]" do
        @h.ref([:a]).should == @h[:a]
      end

      it "[:a, :x]" do
        @h.ref([:a, :x]).should == nil
      end
    
      it "[:a, :b]" do
        @h.ref([:a, :b]).should == @h[:a][:b]
      end

      it "[:a, :b, :x]" do
        @h.ref([:a, :b, :x]).should == nil
      end
    
      it "[:a, :b, :c]" do
        @h.ref([:a, :b, :c]).should == @h[:a][:b][:c]
      end
    end
  end

  describe "#traverse" do
    it "over a 1 level hash" do
      @h = { :a => "a" }
      @h.extend Traversable
      array = []
      @h.traverse do |key_path, value|
        array << [key_path, value]
      end
      array.should == [
        [[:a], "a"]
      ]
    end
    
    it "over a 2 level hash" do
      @h = { :a => { :b => "b" } }
      @h.extend Traversable
      array = []
      @h.traverse do |key_path, value|
        array << [key_path, value]
      end
      array.should == [
        [[:a], { :b => "b" }],
        [[:a, :b], "b"]
      ]
    end

    it "over a 3 level hash" do
      @h = { :a => { :b => { :c => "c" } } }
      @h.extend Traversable
      array = []
      @h.traverse do |key_path, value|
        array << [key_path, value]
      end
      array.should == [
        [[:a], { :b => {:c => "c" }}],
        [[:a, :b], { :c => "c"}],
        [[:a, :b, :c], "c"]
      ]
    end
  end
  
end
