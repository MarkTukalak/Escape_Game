function initializeMenu()
    love.graphics.setFont(love.graphics.newFont(40))
    love.window.setTitle("ESCAPE GAME")

    backgroundImage = love.graphics.newImage("bgimage.jpg")

     startbtn = {
        x = 300,
        y = 400,
        width = 200,
        height = 50,
        backgroundColor = {0.2, 0.6, 0.2},
        haoverColor = {0.3, 0.7, 0.3},
        onclick = start,
        text = "Start"
    }
     Quitbtn = {
            x = 315,
            y = 470,
            width = 170,
            height = 48,
            backgroundColor = {0.6, 0.2, 0.2},
            haoverColor = {0.7, 0.3, 0.3},
            onclick = love.event.quit,
            text = "Quit"
    }
end

function drawMenu()
    love.graphics.draw(backgroundImage, 0, 0, 0, love.graphics.getWidth() / backgroundImage:getWidth(), love.graphics.getHeight() / backgroundImage:getHeight())
    love.graphics.setColor(0, 1, 2)
    love.graphics.printf("ESCAPE GAME", 0, 100, love.graphics.getWidth(), "center")
    love.graphics.setColor(startbtn.backgroundColor)
    love.graphics.rectangle("fill", startbtn.x, startbtn.y, startbtn.width, startbtn.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(startbtn.text, startbtn.x, startbtn.y, startbtn.width, "center")
    love.graphics.setColor(Quitbtn.backgroundColor)
    love.graphics.rectangle("fill", Quitbtn.x, Quitbtn.y, Quitbtn.width, Quitbtn.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(Quitbtn.text, Quitbtn.x, Quitbtn.y, Quitbtn.width, "center")
end

function start()
    game_state.screen = "game"
end