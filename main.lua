local teststng = io.open("string.txt"):read("*all"):lower():gsub('[%p%c]', '')
function string.split(input, separator)
    separator = separator or "%s"
    local matched = string.gmatch(input, '([^'..separator..']+)')
    local numerated = {}
    local numeratedBigrams = {}
    local weights = {}
    for str in matched do
        table.insert(numerated, str)
    end
    for i,v in ipairs(numerated) do
        if i ~= 1 then
            table.insert(numeratedBigrams, numerated[i-1] .. " " .. (v or ""))
        end
    end
    for i,v in ipairs(numeratedBigrams) do
        if not weights[v] then
            weights[v] = 0
        else
            weights[v] = weights[v] + 1
        end
    end
    return weights
end

local weights = string.split(teststng)

for i,v in pairs(weights) do
    print(i .. ": " .. v)
end