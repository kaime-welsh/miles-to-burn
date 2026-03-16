local suit = require "lib.suit"
local MainMenu = {}

function MainMenu:onenter()
end

function MainMenu:update(dt)
  suit.layout:reset(0, 0)
  suit.Label("Miles to Burn", { align = "center" }, suit.layout:row(GameWidth, 30))
  suit.layout:row()
end

function MainMenu:draw()
  love.graphics.clear(love.math.colorFromBytes(15, 15, 15, 255))
  suit.draw()
end

function MainMenu:keypressed(key, scancode, isrepeat)
end

function MainMenu:keyreleased(key)

end

function MainMenu:onexit()

end

return MainMenu
