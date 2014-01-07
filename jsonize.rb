# coding: UTF-8

require 'jsonize/deserialize'
require 'jsonize/serialize'

module Jsonize
  include Jsonize::Deserialize
  include Jsonize::Serialize

  # Internal: Extends the including class with the Jsonize class methods.
  def self.included(base)
    base.extend Deserialize::ClassMethods
    base.extend Serialize::ClassMethods
  end
end
