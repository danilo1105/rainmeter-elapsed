function ElapsedMonths(hexaPast,hexaPresent,hexaFuture,months,line,max,ageStart,ageEnd)

  local labelMarkupStart = SKIN:GetVariable('labelLuaMarkupStart', '')
  local labelMarkupYears = SKIN:GetVariable('labelLuaMarkupYears', '')

  local str = ""
  local floorMonths = math.floor(months)

  for i=1,max do
    if i < floorMonths then
      str = str .. "[\\x" .. hexaPast .. "]"
    elseif i == floorMonths then
      str = str .. "[\\x" .. hexaPresent .. "]"   
    else
      str = str .. "[\\x" .. hexaFuture .. "]"
    end
    if math.fmod(i,line) == 0 then
      str = str .. "\13\10"
    end
    if i == ageStart * 12  then
      str = str .. labelMarkupStart .. " " .. ageStart .. " " .. labelMarkupYears .. "\13\10"
    end    
    if i == ageEnd * 12 then
      str = str .. labelMarkupStart .. " " .. ageEnd .. " " .. labelMarkupYears .. "\13\10"
    end
  end

  return str
end
