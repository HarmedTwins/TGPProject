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
      print(w)
      if w == "X" then
        local tempWall = {}
        tempWall.x = (j-2)*32
        tempWall.y = (i-1)*32
        tempWall.width = 32
        tempWall.height = 32
        tempWall.draw = true
        tempWall.lethal = false
        Colliders[i][j] = tempWall
        if Colliders[i][j-1] == "null" then
          local tempWall = {}
          tempWall.x = (j-2)*32 - 1
          tempWall.y = (i-1)*32 + 9
          tempWall.width = 1
          tempWall.height = 23
          tempWall.draw = false
          tempWall.lethal = true
          Colliders[i][j-1] = tempWall
        end
      else
        Colliders[i][j] = "null"
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

function draw()
  rowsUsed = 0
  for i,v in ipairs(Colliders) do
    rowsUsed = rowsUsed + 1
    for j,w in ipairs(Colliders[i]) do
      if not(w == "null") and w.draw then
        love.graphics.setColor(255, 0, 0)
        love.graphics.rectangle("fill", w.x, w.y, w.width, w.height)
      end
    end
  end
end