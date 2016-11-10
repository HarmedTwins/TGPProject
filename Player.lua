module("Player", package.seeall)
require("Level")

function init()
  x = 100
  y = 100
  width = 20
  height = 60
  baseWidth = width
  baseHeight = height
  velocity = 0
  
  x = x - (baseWidth - baseHeight)/2
  y = y - baseHeight + baseWidth
  
  jumpKey = false
  jumpKeyHeld = false
  slideKey = false
  slideKeyHeld = false
end

function draw()
  --love.graphics.setColor(255, 0, 0)
  --love.graphics.rectangle("fill",0, 300, 700, 700)
  
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", x, y, width, height)
  
end

function update(dt)
  if love.mouse.isDown(1) then
    handleTouch(love.mouse.getY())
  else
    jumpKey = false
    slideKey = false
  end
  
  if jumpKey and not(jumpKeyHeld) then
    velocity = -800
    y = y + velocity * dt
    jumpKeyHeld = true
  else
    if velocity < 1000 then
      velocity = velocity + 50
    else
      velocity = 1000
    end
  end
  
  if slideKey and not(slideKeyHeld) then
    x = x + (baseWidth - height)/2
    y = y + baseHeight - baseWidth
    
    width = baseHeight
    height = baseWidth
    
    slideKeyHeld = true
  end
  
  if not(slideKey) then
    if slideKeyHeld then
      x = x - (baseWidth - baseHeight)/2
      y = y - baseHeight + baseWidth
    end
    
    width = baseWidth
    height = baseHeight
    
    slideKeyHeld = false
  end
  
  if not(CheckCollision(x, y, width, height, 0, 300, 700, 700)) then
    y = y + velocity * dt
  else
    i = 1
    while CheckCollision(x, y - i, width, height, 0, 300, 700, 700) do
      i = i + 1
    end
    y = y - i + 1
    
    jumpKeyHeld = false
  end
end

function handleTouch(pos)
  if pos < 720/4 then
    jumpKey = true
  else
    slideKey = true
  end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end