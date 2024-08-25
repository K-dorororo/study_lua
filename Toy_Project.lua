local clock = os.clock

function wait(n)
  local waitfortime = clock()
  while clock() -waitfortime <= n do end
end

function enterText(n)
  for i = 0, n do
    print("")
  end
end


-- 시작 화면 
function MainMenu()
  local gameStartButton = 0
  enterText(20)
  print("    -------------------------------------")
  print("    |                                   |")
  print("    |    전투 시스템 테스트 준비 끝 !   |")
  print("    |                                   |")
  print("    -------------------------------------")
  print("    -------------------------------------")
  print("    |                                   |")
  print("    |  1 : 게임시작   |  2 : 게임 종료  |")
  print("    |                                   |")
  print("    -------------------------------------")

  gameStartButton = io.read("*n")

  if gameStartButton == 1 then
    choiceClass()
  elseif gameStartButton == 2 then
    print("3초 후 게임을 종료합니다.")
    wait(3)
  end
end

-- 직업 박체린
function ClassPark()
  Name = "우주최강 박체린"
  HP = 50
  MP = 50
  Dam = 5
  MDam = 7
end

-- 직업 심규석
function ClassShim()
  Name = "쫄따구 심규석"
  HP = 20
  MP = 10
  Dam = 1
  MDam = 4
end

-- 몬스터 오크
function MonsterOrk()
  print("    ----------------------------")
  print("    |                          |")
  print("    | 오크가 시비를 걸어왔다 ! |")
  print("    |                          |")
  print("    ----------------------------")

  MonsterName = "어딘가 이상한 오크"
  MonsterHP = math.floor(math.random(20, 40))
  MonsterDam = 3
end

-- 직업 선택창
function choiceClass()
  math.randomseed(os.time())
  userClass = 0
  enterText(20)
  print("    -----------------------------------")
  print("    |                                 |")
  print("    |    당신의 직업을 선택하세요 !   |")
  print("    |                                 |")
  print("    -----------------------------------")
  print("    -----------------------------------")
  print("    |                                 |")
  print("    |        1 : 우주최강 박체린      |")
  print("    |        2 : 쫄따구 심규석        |")
  print("    |                                 |")
  print("    -----------------------------------")
  print("    -----------------------------------")
  print("    |                                 |")
  print("    |         우주최강 박체린         |")
  print("    |  HP : ? MP : ? Dam : ? MDam : ? |")
  print("    |                                 |")
  print("    -----------------------------------")
  print("    -----------------------------------")
  print("    |                                 |")
  print("    |           쫄따구 심규석         |")
  print("    |  HP : ? MP : ? Dam : ? MDam : ? |")
  print("    |                                 |")
  print("    -----------------------------------")

  userClass = io.read("*n")

  if userClass == 1 then
    ClassPark()
  elseif userClass == 2 then
    ClassShim()
  end

  MonsterOrk()
  WarSystem()
end


-- 상태 UI
function StatUI()
  enterText(20)

  print("---------------------------------------")
    print("    몬스터의 상태")
    print("------------------------")
    print("|                      |")
    print("| 1 : "..MonsterName.." |")
    print("| HP : "..MonsterHP.." |")
    print("|                      |")
    print("------------------------")
  print("---------------------------------------")

  print("---------------------------------------")
    print("    나의 상태")
    print("    --------------------------------")
    print("    |               |              |")
    print("    |  "..Name.."   |   행동 목록  |")
    print("    |  HP : "..HP.."   |   공격 : 1  |")
    print("    |  MP : "..MP.."   |   방어 : 2  |")
    print("    |  물뎀 : "..Dam.."   |   스킬 : 3  |")
    print("    |  마뎀 : "..MDam.."   |   도주 : 4  |")
    print("    |               |              |")
    print("    --------------------------------")
end

function SkillList(n)
  if n == 1 then
    print("    "..Name.." 이/가 방어태세에 들어갔다.")
    wait(1)
    print("    "..Name.." 이/가 어떤 공격도 막을 것 같다.")
    wait(2)
  elseif n == 2 then
    print("    "..Name.." 이/가 멋들어지게 공격했다.")
    wait(1)
    print("....")
    wait(1)
    print("    오크가 감탄해서 울부짖는다.")
    wait(1)
  elseif n == 3 then
    print("    "..Name.." 이/가 우주최강 딱밤을 준비했따!")
    wait(1)
    print("    "..Name.." 의 주먹이 왕만해졌다 !")
    wait(1)
    SkillDam = 1
  Attack()
  end
end


-- 유저 공격
function Attack()
  print("    "..Name.." 의 공격 ! 결과는 !? ")
  WarDice1 = math.floor(math.random(1,6))
  WarDice2 = math.floor(math.random(1,6))

  DiceVal = WarDice1 + WarDice2
  SkillDam = SkillDam*MDam

  wait(1)
  print(" 첫번째 주사위 : "..WarDice1.."")
  wait(1)
  print(" 두번째 주사위 : "..WarDice2.."")
  wait(1)
  print(" 그 결과는 ? : "..DiceVal.."")
  wait(1)

  if DiceVal < 5 then
    print(" 공격 빗나갔다 ! ")
    wait(1)
    print(" "..MonsterName.." : 응~ 피했쥬 !?")
  elseif 4 < DiceVal and DiceVal < 10 then
    print(" 공격 적중 ! ")
    wait(1)
    print(" "..MonsterName.." : 아..악 !! 아파 !!!")
    if MonsterHP < (Dam + SkillDam) then
      MonsterHP = 0
      print(" "..MonsterName.." 을/를 해치웠다 !")
      FinishGame()
    elseif MonsterHP > (Dam + SkillDam) then
      MonsterHP = MonsterHP - (Dam + SkillDam)
    end
  elseif 9 < DiceVal then
    print(" 크리티컬이 터졌다 !! ")
    wait(1)
    print(" "..MonsterName.." : 크어허허허헣허ㅓㄱ..!! ")
    if MonsterHP < (Dam + SkillDam) then
      MonsterHP = 0
      FinishGame()
    elseif MonsterHP > (Dam + SkillDam) then
      MonsterHP = MonsterHP - ((Dam + SkillDam)*2)
    end
  end
  SkillDam = 0
  wait(1)
end

-- 몬스터 공격
function MonsterAttack()
  wait(1)
  print(" "..MonsterName.." 의 공격 ! 결과는 !? ")
  WarDice1 = math.floor(math.random(1,6))
  WarDice2 = math.floor(math.random(1,6))

  DiceVal = WarDice1 + WarDice2

  wait(1)
  print(" 첫번째 주사위 : "..WarDice1.."")
  wait(1)
  print(" 두번째 주사위 : "..WarDice2.."")
  wait(1)
  print(" 그 결과는 ? : "..DiceVal.."")
  wait(1)

  if DiceVal < 5 then
    print(" 공격이 빗나갔다 ! ")
    wait(1)
    print(""..Name.." : ㅋㅋㅋ 님 뭐함 ?")
  elseif 4 < DiceVal and DiceVal < 10 then
    print(" 공격 적중 ! ")
    wait(1)
    print(""..Name.." : 아 ! 따가워 임마 !")
    if HP < MonsterDam then
      HP = 0
      FinishGame()
    elseif HP > MonsterDam then
      HP = HP - MonsterDam
    end
  elseif 9 < DiceVal then
    print(" 크리티컬이 터져버렸다 !")
    wait(1)
    print(" "..Name.." : 아아아악!!! 이새끼가 !?")
    if HP < MonsterDam then
      HP = 0
    elseif HP > MonsterDam then
      HP = HP - (MonsterDam * 2)
    end
  end
  wait(1)
end


-- 몬스터 AI 행동
function MonsterAIdo()
  AIdo = 0

  print("---------------------------------")
  print("---------------------------------")
    print(""..MonsterName.." 의 차례, 무엇을 하려나 ?")
  print("---------------------------------")
  print("---------------------------------")

  AIdo = math.floor(math.random(1,4))

  if AIdo == 1 then
    print(" "..MonsterName.." 은 공격하기로 마음 먹었다.")

    if whatDo == 2 then
      print(" "..MonsterName.." 의 공격은 실패했고 오히려 본인이 데미지를 받았다 !")
      MonsterHP = MonsterHP - 2
      wait(1)
      print(" "..MonsterName.." 은 소량의 데미지를 입었다 ! ")
    else MonsterAttack() end
  
  elseif AIdo == 2 then
    print(" "..MonsterName.." 은 갑자기 딴짓을 하기 시작했다 !")
    
  elseif AIdo == 3 then
    print(" "..MonsterName.." 은 갑자기 잠을 자기 시작했다.")
    wait(1)
    print(" "..MonsterName.."은 체력을 1 회복했다 !")
    MonsterHP = MonsterHP + 1

  elseif AIdo == 4 then
    print(" "..MonsterName.." 은 공격으로 무방비해진 "..Name.." 을 공격하기 시작했다 !")
    wait(1)

    if whatDo == 1 then
      print(" !!!!!!!!!!!!!!!!!!!!!!! ")
      wait(1)
      print(" 공격은 성공적이었고 꽤나 치명적이었다.")
      HP = HP - (MonsterDam*2)
      wait(1)
      print(" "..Name.." 은 두배의 데미지를 받았다.")
      wait(1)
    else print("  하지만 "..Name.." 은 무방비하지 않았다 !") end
    wait(1)
  end
  wait(3)
end



-- 전투 시스템
function WarSystem()
  enterText(20)
  while HP > 0 and MonsterHP > 0 do
    whatDo = 0
    WarDice1 = 0
    WarDice2 = 0
    DiceVal = 0

    StatUI()
    print("    행동을 입력해주세요.")
    whatDo = io.read("*n")

    if whatDo == 1 then
      Attack()
    elseif whatDo == 2 then
      SkillList(1)
    elseif whatDo == 3 then
      if userClass == 1 then
        SkillList(2)
      elseif userClass == 2 then
        SkillList(3)
      end
    elseif whatDo == 4 then
      print("    무서워서 도망친건... 아니야...!")
      wait(3)
      FinishGame()
    end
    MonsterAIdo()
  end
  
  if HP == 0 then
    enterText(20)
    print("----------------------------------")
    print("|                                |")
    print("|  "..MonsterName.." 의 승리다.. |")
    print("|                                |")
    print("----------------------------------")
    wait(1)
  elseif MonsterHP == 0 then
    enterText(20)
    print("--------------------------------")
    print("|                              |")
    print("|  "..Name.." 의 멋진 승리다 ! |")
    print("|                              |")
    print("--------------------------------")
    wait(1)
  end
end



-- 게임 종료
function FinishGame()
  print(" 계속 하실 ? (게임을 종료하려면 10을 입력하세요.)")

  StopNum = io.read("*n")

  if StopNum == 10 then
    Gamestop = 1
  end
end

Gamestop = 0
SkillDam = 0

while Gamestop do
  MainMenu()
  WarSystem()
  FinishGame()
  if Gamestop == 1 then
    break
  end
end

os.execute("pause")