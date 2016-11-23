module("Player", package.seeall)
require("Level")
require("main")

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
      velocity = velocity + 2500 * dt
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
  
  if not(slideKey) and CanStand() then
    if slideKeyHeld then
      x = x - (baseWidth - baseHeight)/2
      y = y - baseHeight + baseWidth
    end
    
    width = baseWidth
    height = baseHeight
    
    slideKeyHeld = false
  end
  
  onFloor = false
  
  y = y + velocity * dt
  for i,w in ipairs(Level.Colliders) do
    for j, v in ipairs(Level.Colliders[i]) do
      if not(v == "null") then 
       if v.x < x + 32 and x < v.x+v.width  then
          if CheckCollision(x, y, width, height, v.x, v.y, v.width, v.height) then
            if v.lethal then
              main.gamestate = 3
            else
              y = v.y - height
              velocity = 0
              onFloor = true
            end
          end
        end
      end
    end
  end
  
  jumpKeyHeld = not(onFloor)
  
end

function handleTouch(pos)
  if pos < 720/4 then
    jumpKey = true
    slideKey = false
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

function CanStand()
  local canStand = true
  local tempX = x - (baseWidth - baseHeight)/2
  local tempY = y - baseHeight + baseWidth
  
  for i,w in ipairs(Level.Colliders) do
    for j, v in ipairs(Level.Colliders[i]) do
      if not(v == "null") then 
       if v.x < tempX + 32 and tempX < v.x+v.width  then
          if CheckCollision(tempX, tempY, baseWidth, baseHeight, v.x, v.y, v.width, v.height) then
            canStand = false
          end
        end
      end
    end
  end
  
  return canStand
end
