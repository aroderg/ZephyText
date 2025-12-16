local teststng = "dajs hdas hah ha dsh ashd ashd asd hasd hasd hasd hasd"
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
    print(v)
end