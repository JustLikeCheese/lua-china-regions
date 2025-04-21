local function json2lua(json)
    json = json:gsub("%[", "{") -- 去掉左括号
    :gsub("%]", "}") -- 去掉右括号
    :gsub("\"(%--%d+)\"[^,]-:", "[%1] =") -- 数字key改为[1] = 的形式
    :gsub("([^\\])\"([^,]-)\"[^,]-:", "%1[\"%2\"] =") -- 字符串key改为 ["a"] = 的形式
    :match(".+}") -- 尾部的异常内容删除
    return json
end

local read_file = function(path)
    local file = io.open(path, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return content
    end
    return nil
end

local write_file = function(path, content)
    local file = io.open(path, "w")
    if file then
        file:write(content)
        file:close()
        return true
    end
    return false
end

local input_file = "assets/area_code_2024.json"
local output_file = "assets/area_code_2024.lua"

local content = read_file(input_file)
if not content then
    print(string.format("读取文件失败: %s", input_file))
    return
end

local json = json2lua(content)
if not json then
    print("JSON 转换 TABLE 失败: %s", content)
    return
end

local success = write_file("assets/area_code_2024.lua", "return " .. json)
if not success then
    print("写入文件失败: %s", output_file)
end
