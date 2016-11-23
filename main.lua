module("main", package.seeall)
require "Player"
require "Level"
require "Menu"
require "Sound"

function love.load()
  Level.init()
  Player.init()
  Menu.load()
  
  gamestate = 1
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print(string.format("X: %.2f, Y: %.2f", Player.x, Player.y))
  Menu.draw()
  if gamestate == 2 then
    Level.draw()
    Player.draw()
  end
end

function love.update(dt)
  if gamestate == 2 then
    Level.update(dt)
    Player.update(dt)
  end
end

function love.mousepressed(mx, my, button)
  if button == 1
     and mx >= 0 and mx < 640
     and my >= 0 and my < 360
     and gamestate == 1 then
     gamestate = 2
  end
end