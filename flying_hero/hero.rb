require 'gosu'
class Hero

  def initialize
    @sprites = Gosu::Image::load_tiles('assets/images/cat.png', 847/6, 87, tileable: false)
    @width = @sprites.first.width
    @height = @sprites.first.height
    @y = 250
    @x = 10
  end

  def draw
    sprite = @sprites[Gosu::milliseconds / 75% @sprites.size]
    sprite.draw(@x, @y, 1)
  end

  def move_up!
    @y -= 4 if (@y >= 0)
  end

  def move_down!(height)
    @y += 4 if (@y <= height - @height)
  end

  def bumped_into?(object)
      hero_left = @x
      hero_right = @x + @width
      hero_top = @y
      hero_bottom = @y + @height

      object_left = object.x
      object_right = object.x + object.width
      object_top = object.y
      object_bottom = object.y + object.height

      if hero_top > object_bottom
        return false
      elsif hero_bottom < object_top
        return false
      elsif hero_left > object_right
        return false
      elsif hero_right < object_left
        return false
      else
        return true
      end
  end
end