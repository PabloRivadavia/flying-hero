require 'gosu'
require_relative 'flying_item'
class Candy < FlyingItem

def self.image_path
  'assets/images/candy.png'
end

def move!
  @x -= 10

end
end