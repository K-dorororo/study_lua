-- 목적 : 루아 함수 call by value, call by reference 확인
-- call by value : nil, booleans, numbers, strings
-- call by ref : table, function, thread, userdata

function dumpTable(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      -- key가 숫자가 아닌 경우 "key"
      if type(k) ~= 'number' then
        k = '"'..k..'"'
      end
      s = s .. '['..k..'] = ' .. dumpTable(v) .. ','
    end
    return s.. '} '
  else
    return tostring(o)
  end
end

print('--------------------------------------')
print('table을 새로 만들어 리턴')
print('--------------------------------------')

-- 함수에서 만든 table 리턴
function  testfunc()
  local var = {}
  var.x = 100
  var.y = 200
  var.z = {}
  var.z.a = 'aaa'

  return var
end

local tempTable = testfunc()
print(dumpTable(tempTable))

print('-------------------------------------------------------------')
print('arg로 bool, 문자, 숫자, 테이블, nil을 전달해서 바뀌는지 확인')
print('-------------------------------------------------------------')

function funcTestCallBy(bValue, sString, nValue, tableValue, nilValue)
  bValue = true
  sString = '새로온 문자'
  nValue = 100
  tableValue.z = 200
  tableValue.x = 10
  nilValue = {}
end

local bValue = false
local sString = '문자열'
local nValue = 10
local tableValue = {z = 10}
local nilValue = nil

funcTestCallBy(bValue, sString, nValue, tableValue, nilValue)
local sOutput = string.format('bValue = %s, sString = %s, nValue = %d, table = %s, nilValue= %s', tostring(bValue), sString, nValue, dumpTable(tableValue), nilValue)

print(sOutput)