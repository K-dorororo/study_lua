-- 목적 : 루아 테이블 공부하기

function dumpTable(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      -- key 가 숫자가 아닌 경우 "key"
      if type(k) ~= 'number' then
        k = '"'..k..'"'
      end
      s = s .. '['..k..'] = ' ..dumpTable(v) .. ','
    end
    return s.. '} '
  else
    return tostring(o)
  end
end

local listTable = {}

print('---------------------------------------')
print('테이블을 배열/list 처럼 사용하기')
print('---------------------------------------')

-- 리스트 성격으로 초기화
listTable = {"철수", "영희", "바둑이"}

print(dumpTable(listTable))

print(listTable[1])

for i = 1, #listTable do
  print(listTable[i])
end

-- 리스트 순회 - key, value 는 pairs(table) 로 구한다.
for k, v in pairs(listTable) do
  print(k, v)
end

-- 리스트 마지막에 추가
table.insert(listTable, '야옹이')
print(dumpTable(listTable))

-- 리스트 중간에 추가 - 바둑이 자리에 개구리 추가
table.insert(listTable, 3, '개구리')
print(dumpTable(listTable))

-- 개구리 제거
table.remove(listTable, 3)
print(dumpTable(listTable))


-- 리스트안에 리스트
listTable = {}
listTable = {
  {'한국', 'KOREA'},
  {'미국', 'AMERICA'}
}

print(dumpTable(listTable))

-- 새 항목 추가
table.insert(listTable, {'중국', 'CHINA'})
print(dumpTable(listTable))

-- 리스트 안에 리스트에 접근
print(listTable[3][2])

print('---------------------------------------')
print('테이블을 MAP 처럼 사용하기')
print('---------------------------------------')

local dicTable = {
  ['KOREA'] = '한국',
  ['AMERICA'] = '미국'
}
print(dumpTable(dicTable))

-- 테이블 초기화 2 : key = value
local dicTable = {
  KOREA = '한국',
  AMERICA = '미국'
}
print(dumpTable(dicTable))

-- 새로운 key/value 추가 방법 table['key'] = value 또는
-- table.key = value , 단 key는 영어 알파벳만 가능
dicTable.CHINA = '중국'
dicTable['AUSTRALIA'] = '호주'
print(dumpTable(dicTable))
print(dicTable['CHINA'], dicTable.CHINA)

-- key 존재 여부 체크
if dicTable['GERMANY'] == nil then
  print('key GERMANY not exist')
end

--key 제거
dicTable.CHINA = nil
print(dumpTable(dicTable))

print('---------------------------------------')
print('테이블을 구조체 처럼 사용하기')
print('---------------------------------------')
local studentTable = {}
studentTable.name = '철수'
studentTable.age = 18
studentTable.grade = {['영어'] = 90, ['수학'] = 80, ['국어'] = 100}
print(dumpTable(studentTable))


print('---------------------------------------')
print('테이블을 클래스 처럼 사용하기')
print('---------------------------------------')

function studentTable:new(name, age)
  local instance = {
    m_name = name,
    m_age = age,
    m_grade = {['영어'] = 0, ['수학'] = 0, ['국어'] = 0}
  }
  
  setmetatable(instance, self)
  self.__index = self

  return instance
end

objStudentA = studentTable:new('철수', 18)
objStudentB = studentTable:new('영희', 17)

print(dumpTable(objStudentA))
print(dumpTable(objStudentB))