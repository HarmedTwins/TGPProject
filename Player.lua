module("Player", package.seeall)

function init()
  player = {}
  player.x = 30
  player.y = 30
  player.width = 10
  player.height = 30
  player.baseWidth = 10
  player.baseHeight = 30
  
  jumpKey = "up"
  jumpKeyHeld = false
  slideKey = "down"
  slideKeyHeld = false
  
end

function draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", player.x + player.width/2, player.y +player.height/2, player.width, player.height, 1, 1, player.width, player.height)
end

function update(dt)
  if love.keyboard.isDown(jumpKey) and not(jumpKeyHeld) then
    player.y = player.y + 10
    
    jumpKeyHeld = true
  end
  
  if love.keyboard.isDown(slideKey) and not(slideKeyHeld) then
    player.x = player.x - player.baseWidth*2
    player.y = player.y + player.baseHeight
    
    player.width = player.baseHeight
    player.height = player.baseWidth
    
    slideKeyHeld = true
  end
  
  if not(love.keyboard.isDown(jumpKey)) then
    jumpKeyHeld = false
  end
  
  if not(love.keyboard.isDown(slideKey)) then
    if slideKeyHeld then
      player.x = player.x + player.baseWidth*2
      player.y = player.y - player.baseHeight
    end
    
    player.width = player.baseWidth
    player.height = player.baseHeight
    
    slideKeyHeld = false
  end
end