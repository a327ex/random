function love.load()
    game_runs = love.filesystem.getDirectoryItems('game_runs')
    runs = {}
    runs[18] = {}
    for i = 1, 12 do 
        runs[18][i] = {} 
        for j = 1, 31 do
            runs[18][i][j] = {}
            for k = 0, 23 do
                runs[18][i][j][k] = 0
            end
        end
    end

    for _, run in ipairs(game_runs) do
        local day, month, year, hour, min, sec = tonumber(run:sub(1, 2)), tonumber(run:sub(3, 4)), tonumber(run:sub(5, 6)), tonumber(run:sub(8, 9)), tonumber(run:sub(10, 11)), tonumber(run:sub(12, 13))
        runs[year][month][day][hour] = runs[year][month][day][hour] + 1
    end

    keypresses = love.filesystem.getDirectoryItems('keypresses')
    keys = {}
    keys[18] = {}
    for i = 1, 12 do 
        keys[18][i] = {} 
        for j = 1, 31 do
            keys[18][i][j] = {}
            for k = 0, 23 do
                keys[18][i][j][k] = 0
            end
        end
    end
    for _, key in ipairs(keypresses) do
        local presses = love.filesystem.read('keypresses/' .. key)
        local _, _, day, month, year, hour, min, sec = string.find(key, "(%d+)-(%d+)-(%d+)_(%d+)-(%d+)-(%d+)")
        year = year:sub(3, -1)
        year = tonumber(year)
        month = tonumber(month)
        day = tonumber(day)
        hour = tonumber(hour)
        keys[year][month][day][hour] = keys[year][month][day][hour] + 1
    end

    days   = {31,  1,  2,  3,  4,  5,  6}
    months = { 7,  8,  8,  8,  8,  8,  8}

    data_runs = {}
    data_keys = {}
    local k = 1
    for i = 1, #days do
        for j = 0, 23 do
            data_runs[k] = runs[18][months[i]][days[i]][j]
            data_keys[k] = keys[18][months[i]][days[i]][j]
            k = k + 1
        end
    end
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.line(64, 64, 64, 384)
    love.graphics.line(64, 384, 168*4, 384)
end
