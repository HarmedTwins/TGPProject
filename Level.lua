module("Level", package.seeall)

function init()
  file = io.open("level.txt", "r")
  LevelMap = {}
  while true do
    line = file:read()
    if line == nil then break end
    
    temp = {}
    
    local i,j = 0
    for i=0, line:len(), 1
    do
      --temp.tile = line:sub(i, i)
      table.insert(temp, line:sub(i, i))
    end
    table.insert(LevelMap, temp)
  end
  
  Colliders = {}
  
  for i,v in ipairs(LevelMap) do
    Colliders[i] = {}
    --print(v[i].tile)
    for j,w in ipairs(LevelMap[i]) do
      if w == "X" or w == "x" then
        local tempWall = {}
        tempWall.x = (j-2)*32
        tempWall.y = (i-1)*32
        tempWall.width = 32
        tempWall.height = 32
        tempWall.draw = true
        tempWall.special = false
        tempWall.lethal = false
        Colliders[i][j] = tempWall
        if Colliders[i][j-1] == "null" then
          local tempWall = {}
          tempWall.x = (j-2)*32 - 1
          tempWall.y = (i-1)*32 + 9
          tempWall.width = 1
          tempWall.height = 23
          tempWall.draw = false
          tempWall.special = false
          tempWall.lethal = true
          Colliders[i][j-1] = tempWall
        end
      else if w == "C" or w == "c" then
        local checkpoint = {}
        checkpoint.x = (j-2)*32 + 8
        checkpoint.y = (i-2)*32
        checkpoint.width = 16
        checkpoint.height = 64
        checkpoint.draw = true
        checkpoint.special = true
        checkpoint.character = "C"
        checkpoint.active = false
        checkpoint.lethal = false
        Colliders[i][j] = checkpoint
      else
        Colliders[i][j] = "null"
      end
    end
  end
  end
end

function update(dt)
  for i,v in ipairs(Colliders) do
    for j,w in ipairs(Colliders[i]) do
      if not(w == "null") then
        w.x = w.x - 200 * dt   
      end
    end
  end
end

function moveWorld(shift)
  for i,v in ipairs(Colliders) do
    for j,w in ipairs(Colliders[i]) do
      if not(w == "null") then
        w.x = w.x + shift
        --w.x = j*32
      end
    end
  end
end

function draw()
  rowsUsed = 0
  for i,v in ipairs(Colliders) do
    for j,w in ipairs(Colliders[i]) do
      if not(w == "null") and w.draw and w.x >= -w.width and  w.x <= 640  then
        love.graphics.setColor(255, 0, 0)
        love.graphics.rectangle("fill", w.x, w.y, w.width, w.height)
      end
      if w.special then
        love.graphics.setColor(0, 255, 0)
        love.graphics.rectangle("fill", w.x, w.y, w.width, w.height)
      end
    end
  end
end