require 'gosu'
require_relative 'background'
require_relative 'hero'
require_relative 'candy'
class Game < Gosu::Window
def initialize
	super(900, 550, fullscreen: false)
	self.caption = 'Flying hero!'
	@background = Background.new
	@hero = Hero.new
	@candy = Candy.new(self)

end

	def draw
		@background.draw
		@hero.draw
		@candy.draw
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
	end


end

