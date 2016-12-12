module("main", package.seeall)
require "Player"
require "Level"
require "Menu"
require "Sound"

function love.load()
  gamestate = 1
  levelstate = 1
  
  currentcoins = 0
  level1coins = 0
  level2coins = 0
  level3coins = 0
  level4coins = 0
  level5coins = 0
  level1MaxCoins = "??"
  level2MaxCoins = "??"
  level3MaxCoins = "??"
  level4MaxCoins = "??"
  level5MaxCoins = "??"
  
  
  level2unlocked = true
  level3unlocked = false
  level4unlocked = false
  level5unlocked = false
  
  Level.init()
  Level.load()
  Player.init()
  Player.load()
  Menu.load()
  Sound.load()
  Sound.play()
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  Menu.draw()
  if gamestate == 3 then
    Level.draw()
    Player.draw()
  end
end

function love.update(dt)
  if gamestate == 3 then
    Level.update(dt)
    Player.update(dt)
  end
end

function love.mousepressed(mx, my, button)
  if button == 1
     and mx >= 230 and mx < 302 --play button
     and my >= 170 and my < 242
     and gamestate == 1 then
     Sound.playmenuselect()  
     Player.init()
     Level.init()
     levelstate = 1
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  if button == 1
    and mx >= 340 and mx < 412 --level select button
    and my >= 170 and my < 242
    and gamestate == 1 then
    Sound.playmenuselect()
    gamestate = 2
  end
  
  if button == 1
    and mx >= 20 and mx < 188 --return to menu button
    and my >= 270 and my < 342
    and gamestate == 2 then
    Sound.playmenuselect()  
    gamestate = 1
  end
  
  if button == 1
     and mx >= 70 and mx < 142 --replay button
     and my >= 180 and my < 252
     and gamestate == 4 then
     Sound.playmenuselect()
     Player.init()
     Level.init()
     gamestate = 3
     Sound.play() 
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 230 and mx < 398 --menu button
     and my >= 180 and my < 252
     and gamestate == 4 then
     Sound.playmenuselect()  
     gamestate = 1
  end
  
  if button == 1
     and mx >= 500 and mx < 571 --next level button
     and my >= 180 and my < 252
     and gamestate == 4
     and levelstate ~= 5 then
     levelstate = levelstate + 1  
     Player.init()
     Level.init()
     Sound.playmenuselect()  
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  --select level buttons
  
  if button == 1
     and mx >= 280 and mx < 316 --level 1
     and my >= 77 and my < 113
     and gamestate == 2 then
     levelstate = 1  
     Player.init()
     Level.init()
     Sound.playmenuselect()  
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 280 and mx < 316 --level 2
     and my >= 117 and my < 153
     and gamestate == 2 
     and level2unlocked == true then
     levelstate = 2  
     Player.init()
     Level.init()
     Sound.playmenuselect()  
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 280 and mx < 316 --level 3
     and my >= 157 and my < 193
     and gamestate == 2
     and level3unlocked == true then
     levelstate = 3  
     Player.init()
     Level.init()
     Sound.playmenuselect()  
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 280 and mx < 316 --level 4
     and my >= 197 and my < 233
     and gamestate == 2
     and level4unlocked == true then
     levelstate = 4  
     Player.init()
     Level.init()
     Sound.playmenuselect()  
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  if button == 1
     and mx >= 280 and mx < 316 --level 5
     and my >= 237 and my < 277
     and gamestate == 2
     and level5unlocked == true then
     levelstate = 5  
     Player.init()
     Level.init()
     Sound.playmenuselect()  
     gamestate = 3
     Sound.play()
     Player.jumpKeyHeld = true
  end
  
  
  end