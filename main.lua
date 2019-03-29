world = love.physics.newWorld(0, 109, false)  

local palla = require("palla")
local utils = require("utils")

resources= {}

function love.load()
    love.physics.setMeter(64)
    ground = utils.createStaticBox(world, 0, 200,200, 50)
    ground1 = utils.createStaticBox(world, 200, 300, 200, 50)
    ground2= utils.createStaticBox(world, 400, 500, 200, 50)   
    grounds={ground, ground1, ground2} 
end

rotspeed=0.01;
angles = {
    0,
    0,
    0
}
selected = 1

selectedPlatform = 0;

function love.update(dt)
    world:update(dt)
    palla.tick(dt)   
    -- if love.keyboard.isDown("1") then
    --     selected=1    
    -- end
    -- if love.keyboard.isDown("2") then
    --     selected=2
    -- end
    -- if love.keyboard.isDown("3") then
    --     selected=3                
    -- end
    -- if love.keyboard.isDown("q") then        
    --     angles[selected] = angles[selected]+rotspeed
    --     grounds[selected]:setAngle(angles[selected])
        
    -- end
    -- if love.keyboard.isDown("e") then
    --     angles[selected] = angles[selected]-rotspeed
    --     grounds[selected]:setAngle(angles[selected])
    -- end
    -- if love.keyboard.isDown("a") then        
    --     grounds[selected]:setX(grounds[selected]:getX()-1)
    -- end
    -- if love.keyboard.isDown("d") then
    --     grounds[selected]:setX(grounds[selected]:getX()+1)
    -- end
    -- if love.keyboard.isDown("w") then
    --     grounds[selected]:setY(grounds[selected]:getY()-1)
    -- end
    -- if love.keyboard.isDown("s") then
    --     grounds[selected]:setY(grounds[selected]:getY()+1)
    -- end
    if love.mouse.isDown(1) and selectedPlatform == 0 then
        for i, index in ipairs(grounds) do
            mouseX = love.mouse.getX();
            mouseY = love.mouse.getY();

            if mouseX > grounds[i]:getX() - 100 and mouseX < grounds[i]:getX() + 100 and mouseY > grounds[i]:getY() - 25 and mouseY < grounds[i]:getY() + 25 then
                selectedPlatform = i
            end
        end
    elseif love.mouse.isDown(1) and selectedPlatform ~= 0 then
        grounds[selectedPlatform]:setX(love.mouse.getX())
        grounds[selectedPlatform]:setY(love.mouse.getY())
    elseif love.mouse.isDown(2) and selectedPlatform == 0 then
        for i, index in ipairs(grounds) do
            mouseX = love.mouse.getX();
            mouseY = love.mouse.getY();

            if mouseX > grounds[i]:getX() - 100 and mouseX < grounds[i]:getX() + 100 and mouseY > grounds[i]:getY() - 25 and mouseY < grounds[i]:getY() + 25 then
                selectedPlatform = i
            end
        end
    elseif love.mouse.isDown(2) and selectedPlatform ~= 0 then
        if grounds[selectedPlatform]:getY() > love.mouse.getY() then
            angles[selectedPlatform] = angles[selectedPlatform]-rotspeed
        elseif grounds[selectedPlatform]:getY() < love.mouse.getY() then
            angles[selectedPlatform] = angles[selectedPlatform]+rotspeed
        end
        grounds[selectedPlatform]:setAngle(angles[selectedPlatform])
    elseif love.mouse.isDown(1) ~= true and love.mouse.isDown(2) ~= true then
        selectedPlatform = 0
    end

    
end

function love.draw()
    palla.draw()

    love.graphics.translate( ground:getX(), ground:getY())
    love.graphics.rotate(angles[1])  
    love.graphics.translate( -ground:getX(), -ground:getY())  
    love.graphics.rectangle("line", ground:getX()-100, ground:getY() - 25, 200, 50) 
    love.graphics.translate( ground:getX(), ground:getY())
    love.graphics.rotate(-angles[1])
    love.graphics.translate( -ground:getX(), -ground:getY())

    love.graphics.translate(ground1:getX(), ground1:getY())
    love.graphics.rotate(angles[2])    
    love.graphics.translate(-ground1:getX(), -ground1:getY()) 
    love.graphics.rectangle("line", ground1:getX()-100, ground1:getY() - 25, 200, 50)
    love.graphics.translate(ground1:getX(), ground1:getY())
    love.graphics.rotate(-angles[2])
    love.graphics.translate(-ground1:getX(), -ground1:getY()) 

    love.graphics.translate(ground2:getX(), ground2:getY())
    love.graphics.rotate(angles[3])    
    love.graphics.translate(-ground2:getX(), -ground2:getY()) 
    love.graphics.rectangle("line", ground2:getX()-100, ground2:getY() - 25, 200, 50)
    love.graphics.translate(ground2:getX(), ground2:getY())
    love.graphics.rotate(-angles[3])
    love.graphics.translate(-ground2:getX(), -ground2:getY()) 
end