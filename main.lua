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
            weights[v] = 1
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

io.write("Input a word?\n")
local inputword = io.read()
local separator = "%s"

for i,v in pairs(weights) do
    local curMono = 1
    local firstWord = ""
    for word in string.gmatch(i, '([^%s]+)') do
        if curMono == 1 then
            firstWord = word
        end
        if curMono == 2 and word == inputword then
            print(firstWord)
        end
        curMono = curMono + 1
    end
end