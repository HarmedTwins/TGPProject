module("Level", package.seeall)

function load()
 dirt = love.graphics.newImage("assets/dirt.png")
 grass = love.graphics.newImage("assets/grass.png")
 ice = love.graphics.newImage("assets/ice.png")
 snow = love.graphics.newImage("assets/snow.png")
 desert = love.graphics.newImage("assets/desert.png")
 sand = love.graphics.newImage("assets/sand.png")
 nether = love.graphics.newImage("assets/nether.png")
 goop = love.graphics.newImage("assets/goop.png")
end

function init()
  
  if main.levelstate == 1 then
  loadLevel("level1.txt")
  end
  if main.levelstate == 2 then
  loadLevel("level2.txt")
  end
  if main.levelstate == 3 then
  loadLevel("level3.txt")
  end
  if main.levelstate == 4 then
  loadLevel("level4.txt")
  end
  if main.levelstate == 5 then
  loadLevel("level5.txt")
  end
end

function loadLevel(level)
  main.currentcoins = 0
  file = io.open(level, "r")
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
  maxCoins = 0
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
        tempWall.top = false
        if i ~= 0 then
          if Colliders[i-1][j] == "null" or (Colliders[i-1][j] ~= nil and Colliders[i-1][j].special) or (Colliders[i-1][j] ~= nil and Colliders[i-1][j].lethal) then
            tempWall.top = true
          end
        end
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
      else if w == "E" or w == "e" then
        local checkpoint = {}
        checkpoint.x = (j-2)*32 + 8
        checkpoint.y = (i-2)*32
        checkpoint.width = 16
        checkpoint.height = 64
        checkpoint.draw = true
        checkpoint.special = true
        checkpoint.character = "E"
        checkpoint.lethal = false
        Colliders[i][j] = checkpoint
      else if w == "M" or w == "m" then
        maxCoins = maxCoins + 1
        local tempWall = {}
        tempWall.x = (j-2)*32
        tempWall.y = (i-1)*32
        tempWall.width = 32
        tempWall.height = 32
        tempWall.draw = true
        tempWall.special = true
        tempWall.character = "M"
        tempWall.lethal = false
        tempWall.active = true
        Colliders[i][j] = tempWall
      else
        Colliders[i][j] = "null"
      end
    end
  end
end
end
end
  
  if main.levelstate == 1 then
    main.level1MaxCoins = maxCoins
  else if main.levelstate == 2 then
    main.level2MaxCoins = maxCoins
  else if main.levelstate == 3 then
    main.level3MaxCoins = maxCoins
  else if main.levelstate == 4 then
    main.level4MaxCoins = maxCoins
  else if main.levelstate == 5 then
    main.level5MaxCoins = maxCoins
  end
  end
  end
  end
  end
  
  
  
  for i,w in ipairs(Level.Colliders) do
    for j, v in ipairs(Level.Colliders[i]) do
      if not(v == "null") and v.special and v.character == "C" then
        v.active = true
        break
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
        w.x = w.x - shift
      end
    end
  end
end

function draw()
  rowsUsed = 0
  for i,v in ipairs(Colliders) do
    for j,w in ipairs(Colliders[i]) do
      if not(w == "null") and w.draw then
        if w.special then
          if w.character == "M" or w.character == "m" then
          love.graphics.setColor(255, 255, 255)
          love.graphics.draw(Menu.coin, w.x, w.y)
          else 
          love.graphics.setColor(0, 255, 0)
          love.graphics.rectangle("fill", w.x, w.y, w.width, w.height)
          end
        else
          love.graphics.setColor(255, 255, 255)
          if w.top then
            --draw other
            if main.levelstate == 1 or main.levelstate == 3 then
            love.graphics.draw(grass, w.x, w.y)
            end
            if main.levelstate == 2 then
            love.graphics.draw(snow, w.x, w.y)
            end
            if main.levelstate == 4 then
            love.graphics.draw(sand, w.x, w.y)
            end
            if main.levelstate == 5 then
            love.graphics.draw(goop, w.x, w.y)
            end
          else
            if main.levelstate == 1 or main.levelstate == 3 then
            love.graphics.draw(dirt, w.x, w.y)
            end
            if main.levelstate == 2 then
            love.graphics.draw(ice, w.x, w.y)
            end
            if main.levelstate == 4 then
            love.graphics.draw(desert, w.x, w.y)
            end
            if main.levelstate == 5 then
            love.graphics.draw(nether, w.x, w.y)
            end
          end   
        end
      end
    end
  end
end