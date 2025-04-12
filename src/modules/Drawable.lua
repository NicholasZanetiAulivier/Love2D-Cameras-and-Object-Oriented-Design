Drawable = {x = 0 , y = 0 , texture = nil}
Drawable.__index = Drawable


function Drawable:draw(cameraX,cameraY,cameraScaleX,cameraScaleY)
    love.graphics.draw(self.texture,self.x-cameraX,cameraY-self.y)
end

return Drawable