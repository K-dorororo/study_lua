-- 목적 : For문 사용

print('-----------------------------------')
print('0에서 99까지 For문으로 더하기')
print('-----------------------------------')

local sum = 0
for i = 0, 99 do
  sum = sum + i
end

print(sum)


print('-----------------------------------')
print('99에서 0까지 For문으로 더하기')
print('-----------------------------------')

sum = 0
for i = 99, 0, -1 do
  sum = sum + i
end

print(sum)


print('-----------------------------------')
print('일반 배열 테이블에 대한 For문')
print('-----------------------------------')

local list = {'영어', '수학', '과학'}

for i = 1, #list do
  print(list[i])
end


print('---------------------------------------')
print('(키/값)으로 이뤄진 테이블에 대한 For문')
print('---------------------------------------')

local list2 = {eng = 100, math = 90, sci = 80}

for i = 1, #list2 do
  print(list2[i])
end

for k, v in pairs(list2) do
  print(k, v)
end


print('-------------------------------------------')
print('배열과 (키/값)이 섞인 테이블에 대한 For문')
print('-------------------------------------------')
local list3 = {'국어', '수학', '영어', eng = 100, math = 90, sci = 80}

for i = 1, #list3 do
  print(list3[i])
end

for k,v in pairs(list3) do
  print(k, v)
end