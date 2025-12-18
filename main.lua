local teststng = io.open("string.txt"):read("*all")
local weights = {}
function string.split(input, separator)
    separator = separator or "%s"
    local matched = string.gmatch(input, '([^'..separator..']+)')
    local numerated = {}
    local numeratedBigrams = {}
    for str in matched do
        table.insert(numerated, str)
    end
    for i,v in ipairs(numerated) do
        if i ~= 1 then
            table.insert(numeratedBigrams, numerated[i-1] .. " " .. (v or ""))
        end
    end
    return numeratedBigrams
end

local numeratedBigrams = string.split(teststng)

for i,v in pairs(numeratedBigrams) do
    print(i .. ". " .. v)
end