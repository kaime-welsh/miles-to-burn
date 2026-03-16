local push = require "lib.push"

GameState = require "state"
GameWidth, GameHeight = 480, 270
WindowWidth, WindowHeight = love.window.getDesktopDimensions()

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(GameWidth, GameHeight, WindowWidth, WindowHeight, { fullscreen = true })
  GameState:push_state(require "states.game")
end

function love.update(dt)
  require("lib.lurker").update()
  GameState:current():update(dt)
end

function love.draw()
  push:start()
  GameState:current():draw()
  push:finish()
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then love.event.quit() end
  if GameState:current() ~= nil and GameState:current()["keypressed"] ~= nil then
    GameState:current():keypressed(key, scancode, isrepeat)
  end
end

function love.keyreleased(key)
  if GameState:current() ~= nil and GameState:current()["keyreleased"] ~= nil then
    GameState:current():keypressed(key)
  end
end

function love.resize(w, h)
  push:resize(w,h)
end
