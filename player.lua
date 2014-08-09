
player = {}

function player.load()
  player.b = love.physics.newBody(world, 400,200, "dynamic")
  player.b:setMass(10)
  player.s = love.physics.newCircleShape(50)
  player.f = love.physics.newFixture(player.b, player.s)
  player.f:setUserData("Ball")
end

function player.draw()
  love.graphics.setColor(0, 255, 0)
  love.graphics.circle("fill", player.b:getX(),player.b:getY(), player.s:getRadius(), 20)
end

function player.move(delta)
    if love.keyboard.isDown("right") then
        player.b:applyForce(1000, 0)
    elseif love.keyboard.isDown("left") then
        player.b:applyForce(-1000, 0)
    end
    if love.keyboard.isDown("up") then
        player.b:applyForce(0, -5000)
    elseif love.keyboard.isDown("down") then
        player.b:applyForce(0, 1000)
    end
end

function UPDATE_PLAYER(delta)
  player.move(delta)
end

function DRAW_PLAYER()
  player.draw()
end