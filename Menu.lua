module("Menu", package.seeall)
require "main"
function load()
    
  backgroundQuad = love.graphics.newQuad(1,1,640,360,640,360)
  menubg = love.graphics.newImage("assets/menubg.png")
  deathbg = love.graphics.newImage("assets/deathbg.png")
  
  replaybutton = love.graphics.newImage("assets/replaybutton.png")
  homebutton = love.graphics.newImage("assets/homebutton.png")
  
  font = love.graphics.newFont("assets/font.ttf", 20)
end

function draw()
  
  if main.gamestate == 1 then
  love.graphics.draw(menubg, backgroundQuad, 0, 0)
  end

  if main.gamestate == 2 then
  love.graphics.setFont(font)
  love.graphics.print("Coins: ", 10, 20)
  love.graphics.print(main.coins, 100, 20)
  end

  if main.gamestate == 3 then
  love.graphics.draw(deathbg, backgroundQuad, 0, 0)
  love.graphics.draw(replaybutton, 100, 120)
  love.graphics.draw(homebutton, 500, 120)
  end 

end   

function menu_screen()
  
end

function death_screen()
  
end


   