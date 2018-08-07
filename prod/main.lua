function rgb(r, g, b, a)
    return {r/255, g/255, b/255, (a or 255)/255}
end

function remap(old_value, old_min, old_max, new_min, new_max)
    local new_min = new_min or 0
    local new_max = new_max or 1
    local new_value = 0
    local old_range = old_max - old_min
    if old_range == 0 then new_value = new_min
    else
        local new_range = new_max - new_min
        new_value = (((old_value - old_min)*new_range)/old_range) + new_min
    end
    return new_value
end

function dotted_line(x1, y1, x2, y2, dash, gap)
    local dash = dash or 5
    local gap = gap or 2
    local dx, dy = x2-x1, y2-y1
    local an, st = math.atan2(dy, dx), dash+gap
    local len = math.sqrt(dx*dx + dy*dy)
    local nm = (len-dash)/st
    love.graphics.push()
    love.graphics.translate(x1, y1)
    love.graphics.rotate(an)
    for i = 0, nm do love.graphics.line(i*st, 0, i*st + dash, 0) end
    love.graphics.line(nm*st, 0, nm*st + dash, 0)
    love.graphics.pop()
end

function love.load()
    white = rgb(236, 240, 241)
    white2 = rgb(189, 195, 199)
    white3 = rgb(189, 195, 199, 80)
    black = rgb(52, 52, 52)
    black2 = rgb(40, 40, 40)
    blue = rgb(52, 152, 219)
    blue2 = rgb(41, 128, 185)
    red = rgb(231, 76, 60)
    red2 = rgb(192, 57, 43)

    --[[
    gray = rgb(149, 165, 166)
    gray2 = rgb(127, 140, 141)
    ]]--

    love.graphics.setBackgroundColor(black2)
    love.graphics.setColor(white)
    love.graphics.setLineStyle('rough')

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
        keys[year][month][day][hour] = tonumber(presses)
    end

    days   = {31,  1,  2,  3,  4,  5,  6}
    months = { 7,  8,  8,  8,  8,  8,  8}

    data_runs = {}
    data_keys = {}
    dates = {}
    k = 1
    for i = 1, #days do
        for j = 0, 23 do
            data_runs[k] = runs[18][months[i]][days[i]][j]
            data_keys[k] = keys[18][months[i]][days[i]][j]
            dates[k] = '2018-' .. months[i] .. '-' .. days[i] .. ' ' .. j
            k = k + 1
        end
    end

    data_string = ''
    for i = 1, k-1 do
        data_string = data_string .. data_runs[i] .. ',' .. data_keys[i] .. ',' .. dates[i] .. '\n'
    end
    love.filesystem.write('data', data_string)
end

function love.update(dt)
    
end

function love.draw()
    --[[
    love.graphics.push()
    love.graphics.translate(0.5, 0.5)
    love.graphics.setColor(white)
    love.graphics.line(128, 64, 128, 384)
    love.graphics.line(168*4, 64, 168*4, 384)
    love.graphics.line(128, 384, 168*4, 384)
    love.graphics.setColor(white3)
    dotted_line(128, 64, 168*4, 64, 3, 4)
    dotted_line(128, 128, 168*4, 128, 3, 4)
    dotted_line(128, 192, 168*4, 192, 3, 4)
    dotted_line(128, 256, 168*4, 256, 3, 4)
    dotted_line(128, 320, 168*4, 320, 3, 4)

    love.graphics.setColor(blue)
    for i = 1, k-1 do
        local v = remap(data_keys[i], 0, 5000, 384, 64)
        love.graphics.points(128 + (i-1)*4 + 2, v)
    end
    love.graphics.pop()
    ]]--
end
