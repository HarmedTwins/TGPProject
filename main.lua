require "Player"
require "Colliders"

function love.load()
  Colliders.init()
  Player.init()
end

function love.draw()
  Colliders.draw()
  Player.draw()
  
  love.graphics.print(string.format("X: %.2f, Y: %.2f", Player.x, Player.y))
end

function love.update(dt)
  Colliders.update(dt)
  Player.update(dt)
end