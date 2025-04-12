--[[
    A Game object stores all the game items, including the global coordinate system.
    It contains all processes and is instantiated once in main.lua
    Game should naturally have a positive y and a positive x axis. With positive y being up and positive x being right
]]--

Game = {cameras = {} , drawables = {{100,-100}}}
Game.__index = Game

Game.Camera = require('src.modules.Camera')

function Game.Camera:draw(loc)
    for i,v in ipairs(Game.drawables) do
        love.graphics.rectangle('fill',v[1]-loc[1],loc[2]-v[2],100,100)
    end
end

Game.createCamera = function(id,width,height,screenX,screenY,xLoc,yLoc,xScale,yScale)
    local newCam = Game.Camera.new(width,height,xLoc,yLoc,xScale,yScale)
    table.insert(Game.cameras,{id=id,camera=newCam,loc={screenX,screenY}})
end


Game.new = function()
    local instance = setmetatable({},Game)
    instance.createCamera(1,windowWidth,windowHeight,0,0,0,0,1,1)
    return instance
end

function Game:draw()
    love.graphics.setColor(1,1,1,1)
   for i,v in ipairs(Game.cameras) do
        v.camera:draw(v.loc)
   end
   
end

function Game:update(dt)
    
end


return Game