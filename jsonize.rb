# coding: UTF-8

require 'jsonize/deserialize'
require 'jsonize/serialize'

# Public: Extends your model with methods to allow serialization and deserialization between it and a hash. This works
# hand-in-hand with the JSON API as seen below.
#
# Examples
#
#   class Person
#     include Jsonize
#     field :name
#   end
#   class Car
#     include Jsonize
#     field :make
#     collection :passengers, type: Person, source: 'riders'
#   end
#   car_json = '{"make":"Honda","riders":[{"name":"Tony"}]}'
#   car = Car.deserialize(JSON.parse(car_json))
#   car.make       #=> "Honda"
#   car.passengers #=> [#<Person @name=Tony>]
#   car.serialize  #=> {"make" => "Honda", "riders" => [{"name" => "Tony"}]}
#   JSON.generate(car.serialize) #=> '{"make":"Honda","riders":[{"name":"Tony"}]}'
module Jsonize
  include Jsonize::Deserialize
  include Jsonize::Serialize

  # Internal: Extends the including class with the Jsonize class methods.
  def self.included(base)
    base.extend Deserialize::ClassMethods
    base.extend Serialize::ClassMethods
  end
end
