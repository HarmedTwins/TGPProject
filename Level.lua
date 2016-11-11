module("Level", package.seeall)

function init()
  LevelMap = {
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'},
    {'X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X'},
    {'X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X'},
    {'X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X'},
  }
  Colliders = {}
  
  for i,v in ipairs(LevelMap) do
    for j,w in ipairs(LevelMap[i]) do
      if w == 'X' then
        love.graphics.setColor(0, 0, 255)
        local tempWall = {}
        tempWall.x = (j-1)*32
        tempWall.y = (i-1)*32
        tempWall.width = 32
        tempWall.height = 32
        table.insert(Colliders, tempWall)
      end
    end
  end
end

function update()
  
end

function draw()
  for i,v in ipairs(Colliders) do
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
  end
end