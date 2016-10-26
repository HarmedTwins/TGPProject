module("Player", package.seeall)

function init()
  print("Hello ")
end

function draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 0, 0, 800, 150)
end