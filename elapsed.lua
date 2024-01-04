---@diagnostic disable: undefined-global

function Elapsed(hexaPast, hexaPresent, hexaFuture, type, elapsed, line, max, ageStart, ageEnd)
  local errorMessageGreater = "Error: Current time cannot be greater than end time!"
  if ageStart > ageEnd then
    SKIN:Bang("!Log", errorMessageGreater, "Error")
    return errorMessageGreater
  end

  local labelMarkupStart = SKIN:GetVariable('labelLuaMarkupStart', '')
  local labelMarkupYears = SKIN:GetVariable('labelLuaMarkupYears', '')

  local str = ""
  local floorElapsed = math.floor(elapsed)

  local divider = 0

  if type == 'years' then
    divider = 1
  elseif type == 'months' then
    divider = 12
  elseif type == 'weeks' then
    divider = 52
  end

  for i = 1, max do
    if i < floorElapsed then
      str = str .. "[\\x" .. hexaPast .. "]"
    elseif i == floorElapsed then
      str = str .. "[\\x" .. hexaPresent .. "]"
    else
      str = str .. "[\\x" .. hexaFuture .. "]"
    end
    if math.fmod(i, line) == 0 then
      str = str .. " " .. i / divider .. "\13\10"
    end

    -- Divider string
    if i == ageStart * divider then
      str = str .. labelMarkupStart .. " " .. ageStart + 1 .. " " .. labelMarkupYears .. "\13\10"
    end
    if i == ageEnd * divider then
      str = str .. labelMarkupStart .. " " .. ageEnd + 1 .. " " .. labelMarkupYears .. "\13\10"
    end
  end

  return str
end
