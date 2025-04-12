local path = ...

--Get Desktop info

local _, _, flags = love.window.getMode()
desktopWidth, desktopHeight = love.window.getDesktopDimensions(flags.display)
scale = 1

windowWidth , windowHeight = love.graphics.getDimensions()

local Game = require('src.modules.Game')

function love.load()
    game = Game.new()
end
function love.draw()
    game:draw()
end

function love.update(dt)
    game:update(dt)
end
