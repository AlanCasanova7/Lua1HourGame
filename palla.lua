local palla = {}

palla.x = 100
palla.y = 0
palla.radius = 20

palla.speed = 30

palla.body = love.physics.newBody(world, palla.x, palla.y, "dynamic")
palla.shape = love.physics.newCircleShape(palla.radius)
palla.fixture = love.physics.newFixture(palla.body, palla.shape, 1)
palla.fixture:setRestitution(0.9)

function palla.tick(dt)
    --palla.x = palla.x + palla.speed * dt
    --if love.keyboard.getKeyFromScancode
end

function palla.draw()
    --love.graphics.circle("line", palla.x, palla.y, palla.radius)
    love.graphics.circle("line", palla.body:getX(), palla.body:getY(), palla.shape:getRadius())
end

return palla