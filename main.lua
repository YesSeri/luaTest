love.load = function()
  local point = { x = 400, y = 400, rot = 0 }
  adventurer = { img = love.graphics.newImage("assets/adv_walk1.png"), point = point}
  rotSpeed = math.pi/2
end

love.update = function(dt)
  local function getDistance(speed)
    return speed * dt
  end
  local speed = 0
  local point = adventurer.point
  if love.keyboard.isDown('up') then
    speed = -100
  end
  if love.keyboard.isDown('down') then
    speed = 100
  end
  if love.keyboard.isDown('right') then
    point.rot = point.rot + getDistance(rotSpeed)
  end
  if love.keyboard.isDown('left') then
    point.rot = point.rot - getDistance(rotSpeed)
  end
  point.y = point.y + getDistance(speed) * math.cos(point.rot)
  point.x = point.x - getDistance(speed) * math.sin(point.rot)
end
love.draw = function()
  local img = adventurer.img
  print(img:getWidth(), img:getHeight())
  love.graphics.draw(img, adventurer.point.x, adventurer.point.y, adventurer.rot, 1, 1, img:getWidth()/2, img:getHeight()/2)
end
