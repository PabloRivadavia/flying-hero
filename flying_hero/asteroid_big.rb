require 'gosu'
require_relative 'asteroid'
class AsteroidBig < Asteroid


  def initialize(window)
    super
    @scale_x = 2
    @scale_y = 2
  end

  def move!
    @x -= 15
  end

end