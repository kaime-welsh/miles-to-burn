local Game = {
  parallax_layers = {},
  speed = 1,
}

local busYOffset
local frames = 0

local function addParallaxLayer(image, speed)
  table.insert(Game.parallax_layers, {
    image = image,
    speed = speed or 0.0
  })
end

function Game:onenter()
  -- Load assets
  addParallaxLayer(love.graphics.newImage("assets/sprites/clouds.png"), 0.05)
  addParallaxLayer(love.graphics.newImage("assets/sprites/mountains_far.png"), 0.1)
  addParallaxLayer(love.graphics.newImage("assets/sprites/mountains_near.png"), 0.3)
  addParallaxLayer(love.graphics.newImage("assets/sprites/ground.png"), 1.0)

  bus_shadow = love.graphics.newImage("assets/sprites/bus_shadow.png")
  bus_base = love.graphics.newImage("assets/sprites/bus_base.png")
  bus_body = love.graphics.newImage("assets/sprites/bus_body.png")
end

function Game:update(dt)
  frames = frames + 8
  busYOffset = -32 + math.abs(math.sin((frames) * 0.025) * 2)
end

function Game:draw()
  love.graphics.clear(love.math.colorFromBytes(203, 219, 252, 255))
  for i=1,#self.parallax_layers do
    local layer = self.parallax_layers[i]
    local img = layer.image
    local speed = layer.speed

    local layerX = (frames * speed) % img:getWidth()
    love.graphics.draw(img, -layerX, 0)
    love.graphics.draw(img, -layerX + img:getWidth(), 0)
  end

  love.graphics.setColor(1, 1, 1, 0.5)
  love.graphics.draw(bus_shadow, 0, -32)
  love.graphics.setColor(1, 1, 1, 1)

  love.graphics.draw(bus_base, 0, -32)
  love.graphics.draw(bus_body, 0, busYOffset)
end

function Game:keypressed(key, scancode, isrepeat)

end

function Game:keyreleased(key)

end

function Game:onexit()

end

return Game
