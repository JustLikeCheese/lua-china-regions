-- 加载 provinces.lua
local provinces = require("provinces")

function table_to_string(tbl)
    local result = ""
    for _, v in ipairs(tbl) do
        result = result .. v .. " "
    end
    return result
end

-- 精准查询河北省信息
local hebei = provinces.get_province("河北")
print("精准查询省份信息")
print("省份: "..hebei.name.."\n省会: "..hebei.capital.."\n城市: "..table_to_string(hebei.cities))

-- 通过城市名查询省份信息
local beijing = provinces.get_province_by_city("拉萨")
print("\n通过城市名查询省份信息")
print("省份: "..beijing.name.."\n省会: "..beijing.capital.."\n城市: "..table_to_string(beijing.cities))

-- 模糊查询省份信息
local result = provinces.find_province("湖")
local prov1 = result[1]
local prov2 = result[2]

print("\n模糊查询省份信息")
print("已为你找到"..#prov1+#prov2.."个相关结果")

io.write("省份名称相关结果: ")
for k1, v1 in ipairs(prov1) do
    io.write(v1.name .. "(" .. v1.capital .. ") ")
end

io.write("\n城市名称相关结果: ")
for k1, v1 in ipairs(prov2) do
    io.write(v1.name .. "(" .. v1.capital .. ") ")
end