Camera = {width = 0 , height = 0 ,x = 0, y = 0, scaleX = 1 , scaleY = 1}
Camera.__index = Camera

Camera.new = function(width,height,x,y,scaleX,scaleY)
    local instance = setmetatable({},Camera)
    instance.width = width
    instance.height = height
    instance.x = x
    instance.y = y
    instance.scaleX = scaleX
    instance.scaleY = scaleyY
    return instance
end



return Camera