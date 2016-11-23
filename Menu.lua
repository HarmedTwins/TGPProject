module("Menu", package.seeall)
require "main"
function load()
    
  backgroundQuad = love.graphics.newQuad(1,1,640,360,640,360)
  menubg = love.graphics.newImage("assets/menubg.png")
  deathbg = love.graphics.newImage("assets/deathbg.png")
end

function draw()
  
  if main.gamestate == 1 then
  love.graphics.draw(menubg, backgroundQuad, 0, 0)
  end

  if main.gamestate == 3 then
  love.graphics.draw(deathbg, backgroundQuad, 0, 0)
  end 

end   

function menu_screen()
  
end

function death_screen()
  
end


   