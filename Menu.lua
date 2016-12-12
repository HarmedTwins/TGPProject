module("Menu", package.seeall)
require "main"
function load()
    
  backgroundQuad = love.graphics.newQuad(1,1,640,360,640,360)
  menubg = love.graphics.newImage("assets/menubg.png")
  blankbg = love.graphics.newImage("assets/blankbg.png")
  level1bg = love.graphics.newImage("assets/level1bg.png")
  level3bg = love.graphics.newImage("assets/level3bg.png")
  level4bg = love.graphics.newImage("assets/level4bg.png")
  level5bg = love.graphics.newImage("assets/level5bg.png")
  
  playbutton = love.graphics.newImage("assets/playbutton.png")
  levelselectbutton = love.graphics.newImage("assets/levelselectbutton.png")
  coin = love.graphics.newImage("assets/coin.png")
  replaybutton = love.graphics.newImage("assets/replaybutton.png")
  menubutton = love.graphics.newImage("assets/menubutton.png")
  nextlevelbutton = love.graphics.newImage("assets/nextlevelbutton.png")

  locked = love.graphics.newImage("assets/locked.png")
  unlocked = love.graphics.newImage("assets/unlocked.png")
  
  coins = love.graphics.newFont("assets/font.ttf", 20)
  title = love.graphics.newFont("assets/font.ttf", 55)
  level = love.graphics.newFont("assets/font.ttf", 40)
  
  lvl1coins = main.level1coins
  lvl2coins = main.level2coins
  lvl3coins = main.level3coins
  lvl4coins = main.level4coins
  lvl5coins = main.level5coins
  
end

function draw()
  
  if main.gamestate == 1 then
  love.graphics.draw(menubg, backgroundQuad, 0, 0)
  love.graphics.setFont(title)
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.print("Red's Run", 210, 50)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(playbutton, 230, 170)
  love.graphics.draw(levelselectbutton, 340, 170)
  end

  if main.gamestate == 2 then
  love.graphics.draw(blankbg, backgroundQuad, 0, 0)
  
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.setFont(level)
  
  love.graphics.print("Level Selection", 195, 15)
  
  love.graphics.print("Level 1:", 20, 70)
  love.graphics.print(main.level1coins, 160, 70)
  love.graphics.print(string.format("/%s",main.level1MaxCoins), 185, 70)
  
  love.graphics.print("Level 2:", 20, 110)
  love.graphics.print(main.level2coins, 160, 110)
  love.graphics.print(string.format("/%s",main.level2MaxCoins), 185, 110)
  
  love.graphics.print("Level 3:", 20, 150)
  love.graphics.print(main.level3coins, 160, 150)
  love.graphics.print(string.format("/%s",main.level3MaxCoins), 185, 150)
  
  love.graphics.print("Level 4:", 20, 190)
  love.graphics.print(main.level4coins, 160, 190)
  love.graphics.print(string.format("/%s",main.level4MaxCoins), 185, 190)
  
  love.graphics.print("Level 5:", 20, 230)
  love.graphics.print(main.level5coins, 160, 230)
  love.graphics.print(string.format("/%s",main.level5MaxCoins), 185, 230)
  
  
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(coin, 240, 77)
  love.graphics.draw(coin, 240, 117)
  love.graphics.draw(coin, 240, 157)
  love.graphics.draw(coin, 240, 197)
  love.graphics.draw(coin, 240, 237)
  
  love.graphics.draw(unlocked, 280, 77)
  if main.level2unlocked == false then
  love.graphics.draw(locked, 280, 117)
  else
  love.graphics.draw(unlocked, 280, 117)
  end

  if main.level3unlocked == false then
  love.graphics.draw(locked, 280, 157)
  else
  love.graphics.draw(unlocked, 280, 157)
  end

  if main.level4unlocked == false then
  love.graphics.draw(locked, 280, 197)
  else
  love.graphics.draw(unlocked, 280, 197)
  end

  if main.level5unlocked == false then
  love.graphics.draw(locked, 280, 237)
  else
  love.graphics.draw(unlocked, 280, 237)
  end
  
  love.graphics.draw(menubutton, 20, 280)
  end

  if main.gamestate == 3 then
    if main.levelstate == 1 or 2 then
    love.graphics.draw(level1bg, backgroundQuad, 0, 0)
    end
    if main.levelstate == 3 then
    love.graphics.draw(level3bg, backgroundQuad, 0, 0)
    end
    if main.levelstate == 4 then
    love.graphics.draw(level4bg, backgroundQuad, 0, 0)
    end
    if main.levelstate == 5 then
    love.graphics.draw(level5bg, backgroundQuad, 0, 0)
    end
  
  love.graphics.setFont(coins)
  love.graphics.print("Level: ", 10, 20)
  love.graphics.print(main.levelstate, 80, 20)
  love.graphics.draw(coin, 550, 15)
  love.graphics.print("x", 595, 20)
  love.graphics.print(main.currentcoins, 620, 20)
  end

  if main.gamestate == 4 then
  love.graphics.draw(blankbg, backgroundQuad, 0, 0)
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.setFont(level)
  love.graphics.print("Level", 170, 30)
  love.graphics.print(main.levelstate, 280, 30)
  love.graphics.print("complete!", 310, 30)
  
  love.graphics.print(main.currentcoins, 290, 100)
  
  if main.levelstate == 1 then
    love.graphics.print(string.format("/%s",main.level1MaxCoins), 320, 100)
  else if main.levelstate == 2 then
    love.graphics.print(string.format("/%s",main.level2MaxCoins), 320, 100)
  else if main.levelstate == 3 then
    love.graphics.print(string.format("/%s",main.level3MaxCoins), 320, 100)
  else if main.levelstate == 4 then
    love.graphics.print(string.format("/%s",main.level4MaxCoins), 320, 100)
  else if main.levelstate == 5 then
    love.graphics.print(string.format("/%s",main.level5MaxCoins), 320, 100)
  end
  end
  end
  end
  end
  
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(coin, 245, 107)
  love.graphics.draw(replaybutton, 70, 180)
  love.graphics.draw(menubutton, 230, 180)
  if main.levelstate ~= 5 then
  love.graphics.draw(nextlevelbutton, 500, 180)
  end
  end 

end   


   