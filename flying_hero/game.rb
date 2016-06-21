require 'gosu'
require_relative 'background'
require_relative 'hero'
class Game < Gosu::Window
def initialize
	super(900, 550, fullscreen: false)
	self.caption = 'Flying hero!'
	@background = Background.new
	@hero = Hero.new

end

	def draw
		@background.draw
		@hero.draw
	end

	def button_down (id)
		if id == Gosu::KbEscape
			close
		end
	end

	def update
		@background.scroll!
	end


end

