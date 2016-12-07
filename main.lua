module("main", package.seeall)
require "Player"
require "Level"
require "Menu"
require "Sound"

function love.load()
  gamestate = 1
  coins = 0
  Level.init()
  Level.load()
  Player.init()
  Player.load()
  Menu.load()
  Sound.load()
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  Sound.draw()
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
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 100 and mx < 171
     and my >= 120 and my < 193
     and gamestate == 3 then
     Player.init()
     Level.init()
     gamestate = 2
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 500 and mx < 571
     and my >= 120 and my < 193
     and gamestate == 3 then
     Player.init()
     Level.init()
     gamestate = 1
     Player.jumpKeyHeld = true
  end
end