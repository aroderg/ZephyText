local teststng = io.open("string.txt"):read("*all")
local weights = {}
function string.split(input, separator)
    separator = separator or "%s"
    for str in string.gmatch(input, '([^'..separator..']+)') do
        if not weights[str] then
            weights[str] = 1
        else
            weights[str] = weights[str] + 1
        end
    end
end

string.split(teststng)

for i,v in pairs(weights) do
    print(i .. ": " .. v)
end

io.write("Input a word.\n")
local word = io.read()
if weights[word] then
    print("This word has a weight of " .. weights[word] .. ".")
else
    print("This word has not been weighted.")
end