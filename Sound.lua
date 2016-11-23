module("Sound", package.seeall)
require "main"

function load()
menu = love.audio.newSource("assets/menu.wav", "stream")
level1 = love.audio.newSource("assets/level1.wav", "stream")
end

function draw()
if main.gamestate == 1 then
love.audio.stop(level1)
love.audio.play(menu)
end

if main.gamestate == 2 then
love.audio.stop(menu)
love.audio.play(level1)  
end

if main.gamestate == 3 then
love.audio.stop(level1)
love.audio.play(menu)
end
end

