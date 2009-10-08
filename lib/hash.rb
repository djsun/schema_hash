require File.expand_path(File.dirname(__FILE__) + '/schemable')

class Hash
  
  def schema=(hash)
    self.extend Schemable
    self.schema = hash
  end
  
end
