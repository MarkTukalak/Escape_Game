function love.load()
    love.window.setTitle("Escapist")
    love.window.setMode(800, 600)
    require("menu")
    require("Rooms")
    initializeMenu()
    initializeRooms()
    game_state = {
        screen = "menu",
        current_room = "room1"
    }
    hoverObject = nil
    destinationObject = nil
end
function love.update(dt)
    if game_state.screen == "game" then
        hoverObject = nil
        local currentRoom = rooms[game_state.current_room]
        for _, object in ipairs(currentRoom.objects) do
            if checkCollision(love.mouse.getX(), love.mouse.getY(), object.x, object.y, object.width, object.height) then
                hoverObject = object
            end
            if object.isDestination then
                destinationObject = object
            end
            if object.isDragging then
                object.x = love.mouse.getX() - object.width / 2
                object.y = love.mouse.getY() - object.height / 2

                if checkCollision(object.x, object.y, destinationObject.x, destinationObject.y, destinationObject.width, destinationObject.height) then
                    print("Dropped " .. object.name .. " on " .. destinationObject.name)
                    game_state.current_room = "room3"
                end
            end
        end
        if hoverObject then
            print("Hovering over: " .. hoverObject.name)
        end
    end
end

function love.draw()
    if game_state.screen == "menu" then
        drawMenu()
    elseif game_state.screen == "game" then
        drawGame()
    end
end

function drawGame()
    local room = rooms[game_state.current_room]
    love.graphics.clear(room.BackgroundColor)
    for _, object in ipairs(room.objects) do
        love.graphics.setColor(object.color)
        love.graphics.rectangle("fill", object.x, object.y, object.width, object.height)
    end
    if hoverObject then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(hoverObject.description, 10, 10)
        love.graphics.rectangle("fill", hoverObject.x, hoverObject.y, hoverObject.width, hoverObject.height)
    end
end

function checkCollision(ax, ay, bx, by, bw, bh)
    return ax >= bx and ax <= bx + bw and ay >= by and ay <= by + bh
end

function love.mousepressed(x, y, button)
    if button == 1 then
        print("button1 down ")
        if game_state.screen == "game" then
            if hoverObject then
                hoverObject:onClick()
                if hoverObject.isDraggable then
                    hoverObject.isDragging = true
                end
            end

        elseif game_state.screen == "menu" then
            if checkCollision(x, y, startbtn.x, startbtn.y, startbtn.width, startbtn.height) then
                startbtn.onclick()
            elseif checkCollision(x, y, Quitbtn.x, Quitbtn.y, Quitbtn.width, Quitbtn.height) then
                Quitbtn.onclick()
            end
        end
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then
        print("button released")
        if hoverObject and hoverObject.isDragging then
            hoverObject.isDragging = false
            print("Stopped dragging: " .. hoverObject.name)
        end
    end
end
