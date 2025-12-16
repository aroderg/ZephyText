local teststng = "dajs hdas hah ha dsh ashd ashd asd hasd hasd hasd hasd"
function string.split(input, separator)
    separator = separator or "%s"
    local i = 1
    for str in string.gmatch(input, '([^'..separator..']+)') do
        i = i + 1
        print(str)
    end
end

print(string.split(teststng))