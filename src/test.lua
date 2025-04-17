-- ���� provinces.lua
local provinces = require("provinces")

function table_to_string(tbl)
    local result = ""
    for _, v in ipairs(tbl) do
        result = result .. v .. " "
    end
    return result
end

-- ��׼��ѯ�ӱ�ʡ��Ϣ
local hebei = provinces.get_province("�ӱ�")
print("��׼��ѯʡ����Ϣ")
print("ʡ��: "..hebei.name.."\nʡ��: "..hebei.capital.."\n����: "..table_to_string(hebei.cities))

-- ͨ����������ѯʡ����Ϣ
local beijing = provinces.get_province_by_city("����")
print("\nͨ����������ѯʡ����Ϣ")
print("ʡ��: "..beijing.name.."\nʡ��: "..beijing.capital.."\n����: "..table_to_string(beijing.cities))

-- ģ����ѯʡ����Ϣ
local result = provinces.find_province("��")
local prov1 = result[1]
local prov2 = result[2]

print("\nģ����ѯʡ����Ϣ")
print("��Ϊ���ҵ�"..#prov1+#prov2.."����ؽ��")

io.write("ʡ��������ؽ��: ")
for k1, v1 in ipairs(prov1) do
    io.write(v1.name .. "(" .. v1.capital .. ") ")
end

io.write("\n����������ؽ��: ")
for k1, v1 in ipairs(prov2) do
    io.write(v1.name .. "(" .. v1.capital .. ") ")
end