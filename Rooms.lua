rooms = {}
function initializeRooms()
    rooms.room1 = {
        name = "room 1",
        BackgroundColor = {0, 1, 0},
        objects = {}
    }
    local purplebox = {
        name = "Purple Box",
        description = "A Purple Box",
        x = 150,
        y = 300,
        width = 30,
        height = 60,
        color = {140, 0, 191},
        isDraggable = false,
        onClick = function(self)
            game_state.current_room = "room2"
        end
    }
    table.insert(rooms.room1.objects, purplebox)

    local bluebox = {
        name = "Blue Box",
        description = "A Blue Box",
        x = 150,
        y = 200,
        width = 30,
        height = 60,
        color = {0, 0, 255},
        isDraggable = false,
        onClick = function(self)
            print("You clicked the blue box!")
        end
    }

    table.insert(rooms.room1.objects, bluebox)

    rooms.room2 = {
        name = "room 2",
        BackgroundColor = {1, 0, 0},
        objects = {}
    }

    local greenbox = {
        name = "Key",
        description = "A Key",
        imageFile = "key.png",
        x = 150,
        y = 200,
        width = 30,
        height = 60,
        color = {0, 1, 0},
        isDragging = false,
        isDraggable = true,
        onClick = function(self)
            print("You clicked the blue box!")
        end

    }
    local destination = {
        name = "Destination Box",
        description = "A Destination Box",
        x = 360,
        y = 470,
        width = 30,
        height = 60,
        color = {142/255, 60/255, 215/255},
        isDraggable = false,
        isDestination = true,
        onClick = function(self)
            print("You clicked the blue box!")
        end

    }
    table.insert(rooms.room2.objects, greenbox)
    table.insert(rooms.room2.objects, destination)

        rooms.room3 = {
        name = "room 3",
        BackgroundColor = {1, 1, 0},
        objects = {}
    }

end
