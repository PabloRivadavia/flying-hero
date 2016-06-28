require 'gosu'
require_relative 'background'
require_relative 'hero'
require_relative 'candy'
require_relative 'asteroid'
require_relative 'asteroid_big'
require_relative 'asteroid_small'
class Game < Gosu::Window

def initialize
	super(900, 550, fullscreen: false)
	self.caption = 'Flying hero!'
	@background = Background.new
	@hero = Hero.new
	@candy = Candy.new(self)
	set_asteroid

end

	def draw
		@background.draw
		@hero.draw
		@candy.draw
		@asteroid.draw
	end

	def button_down (id)
		if id == Gosu::KbEscape
			close
		end
	end

	def update
		@background.scroll!
		if button_down?(Gosu::KbUp)
			@hero.move_up!
		elsif button_down? (Gosu::KbDown)
			@hero.move_down!(height)
		end
		@candy.move!
		if (@candy.x <0)
			@candy.reset!(self)
		end
	end

		def set_asteroid
@asteroid = @asteroid && @asteroid.instance_of?(AsteroidBig) ?
			AsteroidSmall.new(self) : AsteroidBig.new(self)
		end

	end


