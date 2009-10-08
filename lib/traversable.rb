module Traversable
  
  def traverse(&block)
    self.each do |key, value|
      Traversable._traverse(key, value, [], &block)
    end
  end
    
  def self._traverse(key, value, path, &block)
    if value.is_a?(Hash)
      value.each do |k, v|
        p = path + [key]
        yield(p, value)
        _traverse(k, v, p, &block)
      end
    else
      yield(path + [key], value)
    end
  end
  
  # reference(["a", "b"]) is a safe version of self["a"]["b"]
  def ref(key_path)
    object = self
    key_path.each do |key|
      object = object.is_a?(Hash) ? object[key] : nil
    end
    object
  end
  
end
