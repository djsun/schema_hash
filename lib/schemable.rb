require File.expand_path(File.dirname(__FILE__) + '/traversable')

module Schemable

  include Traversable

  attr_reader :schema
  
  def schema=(schema)
    hash = schema.dup
    hash.extend Traversable
    @schema = hash.dup.extend Traversable
  end

  def valid?
    valid_subset? && !invalid_superset?
  end

  # Are all required keys present?
  # "valid when nothing is missing"
  def valid_subset?
    valid = true
    schema.traverse do |key_path, value|
      actual = self.ref(key_path)
      missing = actual.nil?
      valid = valid && !missing
    end
    valid
  end
  
  # Are no extra keys present?
  # "invalid when something is unexpected"
  def invalid_superset?
    invalid = false
    self.traverse do |key_path, value|
      expected = schema.ref(key_path)
      invalid = invalid || !expected
    end
    invalid
  end
  
end
