require "Player"
require "Level"

function love.load()
  Level.init()
  Player.init()
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print(string.format("X: %.2f, Y: %.2f", Player.x, Player.y))
  
  Level.draw()
  Player.draw()
end

function love.update(dt)
  Level.update(dt)
  Player.update(dt)
end