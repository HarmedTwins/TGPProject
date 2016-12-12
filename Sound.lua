module("Sound", package.seeall)
require "main"

function load()
menu = love.audio.newSource("assets/menu.wav", "stream")
menu:setLooping(true)
level1 = love.audio.newSource("assets/level1.wav", "stream")
level1:setLooping(true)
level2 = love.audio.newSource("assets/level2.wav", "stream")
level2:setLooping(true)
level3 = love.audio.newSource("assets/level3.wav", "stream")
level3:setLooping(true)
level4 = love.audio.newSource("assets/level4.wav", "stream")
level4:setLooping(true)
level5 = love.audio.newSource("assets/level5.wav", "stream")
level5:setLooping(true)
jump = love.audio.newSource("assets/jump.wav", "static")
menuselect = love.audio.newSource("assets/menuselect.wav", "static")
end

function play()
if main.gamestate == 1 or 2 or 4 then
love.audio.stop()
love.audio.play(menu)
end

if main.gamestate == 3 and main.levelstate == 1 then
love.audio.stop()
love.audio.play(level1)
end

if main.gamestate == 3 and main.levelstate == 2 then
love.audio.stop()
love.audio.play(level2)
end

if main.gamestate == 3 and main.levelstate == 3 then
love.audio.stop()
love.audio.play(level3)
end

if main.gamestate == 3 and main.levelstate == 4 then
love.audio.stop()
love.audio.play(level4)
end

if main.gamestate == 3 and main.levelstate == 5 then
love.audio.stop()
love.audio.play(level5)
end
end

function playmenuselect()
love.audio.play(menuselect)
end

function playjump()
love.audio.play(jump)
end

