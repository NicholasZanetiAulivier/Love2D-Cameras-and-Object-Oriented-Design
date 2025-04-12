--[[
    A Game object stores all the game items, including the global coordinate system.
    It contains all processes and is instantiated once in main.lua
    Game should naturally have a positive y and a positive x axis, with positive y being up and positive x being right

    Game.cameras stores all game cameras. Each item contains
    {
    id : id of camera
    camera : camera object
    loc : {x,y} location of the camera relative to the screen
    }
    
    Game.objects stores all drawable objects. Each item is part of the Drawable class
    {
    x : 
    }
]]--

Game = {cameras = {} , objects = {}}
Game.__index = Game

Game.Camera = require('src.modules.Camera')

function Game.Camera:draw(loc)
    love.graphics.setCanvas(self.canvas)
    for i = #Game.objects,1,-1 do
        Game.objects[i]:draw(loc[1],loc[2],self.scaleX,self.scaleY)
    end
    love.graphics.setCanvas()
    
end

Game.createCamera = function(id,width,height,screenX,screenY,xLoc,yLoc,xScale,yScale)
    local newCam = Game.Camera.new(width,height,xLoc,yLoc,xScale,yScale)
    table.insert(Game.cameras,{id=id,camera=newCam,loc={x=screenX,y=screenY},scale={1,1}})
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