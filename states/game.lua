local Game = {
  parallax_layers = {},
  fuel = 100,
  materials = {
    scrap = 0,
    organic = 0,
    energy = 0,
  },
  speed = 0.3,
  max_speed = 2.0,
  distance = 0,
  solar_panels = {
    level = 1,
    output = 0.25,
  },
  algae_farm = {
    level = 1,
    output = 0.25,
  },
  fuel_converter = {
    level = 1,
    output = 0.25
  },
}

local frames = 0

local function addUpgrade()
  return {
    x = 0,
    y = 0,
    level = 0,
    damage = 0,
  }
end

local function addParallaxLayer(image, speed)
  table.insert(Game.parallax_layers, {
    image = image,
    speed = speed or 0.0
  })
end

function Game:onenter()
  addParallaxLayer(love.graphics.newImage("assets/sprites/clouds.png"), 0.05)
  addParallaxLayer(love.graphics.newImage("assets/sprites/mountains_far.png"), 0.1)
  addParallaxLayer(love.graphics.newImage("assets/sprites/mountains_near.png"), 0.3)
  addParallaxLayer(love.graphics.newImage("assets/sprites/ground.png"), 1.0)

  font_micro = love.graphics.newFont("assets/fonts/Micro_Chat_Monospaced.ttf", 5)
  bus_shadow = love.graphics.newImage("assets/sprites/bus_shadow.png")
  bus_base = love.graphics.newImage("assets/sprites/bus_base.png")
  bus_body = love.graphics.newImage("assets/sprites/bus_body.png")
  ui_hud_panel = love.graphics.newImage("assets/sprites/ui_hud.png")
end

function Game:update(dt)
  frames = frames + 8
  self.distance = self.distance + ((self.speed * 2) * dt)
end

function Game:draw()
  love.graphics.clear(love.math.colorFromBytes(203, 219, 252, 255))
  -- background draw
  for i = 1, #self.parallax_layers do
    local layer = self.parallax_layers[i]
    local img = layer.image
    local speed = layer.speed * self.speed

    local layerX = (frames * speed) % img:getWidth()
    love.graphics.draw(img, -layerX, 0)
    love.graphics.draw(img, -layerX + img:getWidth(), 0)
  end

  -- bus draw
  local busXOffset = -10
  local busYOffset = -24
  love.graphics.setColor(1, 1, 1, 0.5)
  love.graphics.draw(bus_shadow, busXOffset, busYOffset)
  love.graphics.setColor(1, 1, 1, 1)

  love.graphics.draw(bus_base, busXOffset, busYOffset)
  love.graphics.draw(bus_body, busXOffset, busYOffset + math.abs(math.sin((frames) * 0.015) * 2))

  -- ui draw
  love.graphics.draw(ui_hud_panel, 0, 0)
  love.graphics.setColor(love.math.colorFromBytes(217, 87, 99, 255))
  love.graphics.print(string.format("%08d", self.distance), font_micro, 249, 10)
  love.graphics.setColor(1, 1, 1, 1)

  love.graphics.print({ { 0, 1, 0, 1 }, self.speed }, 0, 0)
end

function Game:keypressed(key, scancode, isrepeat)
  if key == "up" then self.speed = self.speed + 0.1 end
  if key == "down" then self.speed = self.speed - 0.1 end
end

function Game:keyreleased(key)

end

function Game:onexit()

end

return Game
