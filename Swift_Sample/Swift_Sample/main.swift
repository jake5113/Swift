import Foundation

func ex6() {
    print("초 입력:", terminator: " ")
    let inputSecond = Int(readLine()!)!
    let hour = inputSecond / (60 * 60)
    let min = (inputSecond % (60 * 60)) / 60
    let sec = inputSecond % 60
    
    print("\(hour) 시 \(min) 분 \(sec) 초")
}

func ex7() {
    let wage = 5000
    let overtimeWage = Double(wage) * 1.5
    let standardHour = 8
    var pay:Double
    
    print("노동 시간 입력: ", terminator: " ")
    let workTime = Int(readLine()!)!
    let isOvertime = workTime > standardHour
    if(workTime > 13) {
        print("ILLEGAL!!")
        return ex7()
    } else if(isOvertime) {
        pay = Double(standardHour * wage) + Double(workTime - standardHour) * overtimeWage
    } else {
        pay = Double(workTime * wage)
    }
    print(Int(pay))
}

func ex8() {
    print("정수 입력: ", terminator: " ")
    let num = Int(readLine()!)!
    print("\(num)은 \(num % 2 == 0 ? "짝수" : "홀수")입니다. ")
}

func ex9() {
    print("첫번째 정수 입력: ", terminator: " ")
    let num1 = Int(readLine()!)!
    print("두번째 정수 입력: ", terminator: " ")
    let num2 = Int(readLine()!)!
    
    print("두 수의 차: \(num1 > num2 ? num1 - num2 : num2 - num1)")
}

func ex10() {
    print("농구공 개수 입력: ", terminator: " ")
    let balls = Int(readLine()!)!
    
    print("필요한 상자의 수: \(balls % 5 == 0 ? balls / 5 : balls / 5 + 1)")
}


func if01() {
    let age = Int(readLine()!)!
    if age >= 20 {
        print("성인입니다.")
    }
}

func if02() {
    print("정수 입력: ", terminator: "")
    let num = Int(readLine()!)!
    if(num % 3 == 0 && num % 5 == 0){
        print("3과 5의 배수입니다.")
    }
}

func if03(){
    print("점수입력: ", terminator: "")
    let grade = Int(readLine()!)!
    
    if(grade>=60){
        print("합격입니다")
    } else {
        print("불합격입니다")
    }
}

func if04(){
    print("정수입력: ", terminator: "")
    let num = Int(readLine()!)!
    
    if num > 0 {
        print("양수입니다.")
    } else if num < 0 {
        print("음수입니다.")
    } else{
        print("0 입니다.")
    }
}

func if05(){
    print("num1: ", terminator: "")
    let num1 = Int(readLine()!)!
    print("num2: ", terminator: "")
    let num2 = Int(readLine()!)!
    print("큰 수 : \(num1 > num2 ? num1 : num2)")
}

func if06(){
    var arr1 = [Int]()
    print("1과목 소프트웨어 설계: ", terminator: "")
    let sub1 = Int(readLine()!)!
    print("2과목 소프트웨어 개발: ", terminator: "")
    let sub2 = Int(readLine()!)!
    print("3과목 데이터베이스 구축: ", terminator: "")
    let sub3 = Int(readLine()!)!
    print("4과목 프로그래밍 언어 활용: ", terminator: "")
    let sub4 = Int(readLine()!)!
    print("5과목 정보시스템 구축관리: ", terminator: "")
    let sub5 = Int(readLine()!)!
    
    arr1.append(sub1)
    arr1.append(sub2)
    arr1.append(sub3)
    arr1.append(sub4)
    arr1.append(sub5)
    
    var sum:Int = 0
    
    for i in 0..<arr1.count {
        if(arr1[i] < 8){
            print("불합격입니다!")
            return
        }
        sum += Int(arr1[i])
    }
    if sum >= 60 {
        print("합격입니다!")
    } else {
        print("불합격입니다!")
    }
}

func if14()->Int{
    print("금액입력: ", terminator: "")
    let insertMoney = Int(readLine()!)!
    
    print("메뉴 입력")
    print("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : ", terminator: "")
    let menu = Int(readLine()!)!
    
    var price:Int
    switch menu {
    case 1:
        price = 800
    case 2:
        price = 500
    case 3:
        price = 1500
    default:
        price = 0
    }
    
    let changeMoney = insertMoney - price
    print("잔돈: \(changeMoney >= 0 ? String(changeMoney) : "돈이 부족해요")")
    return changeMoney
}

func if16(){
    let changeMoney = if14()
    let thousandWon = changeMoney / 1000
    let fiveHundredWon = (changeMoney - thousandWon * 1000) / 500
    let hundredWon = (changeMoney - thousandWon * 1000 - fiveHundredWon * 500) / 100
    print("천원: \(thousandWon)개, 오백원: \(fiveHundredWon)개, 백원: \(hundredWon)개")
}

func while01(){
    var inputNum: Int = 0
    while inputNum < 10 {
        print("정수 입력: ", terminator: "")
        inputNum = Int(readLine()!)!
    }
    print("종료!")
}

func while02(){
    print("현재 몸무게: ", terminator: "")
    var currentWeight = Int(readLine()!)!
    print("현재 몸무게: ", terminator: "")
    let purposeWeight = Int(readLine()!)!
    
    var week = 1
    while(currentWeight >= purposeWeight) {
        print("\(week)주차 감량 몸무게: ", terminator: "")
        let lossWeight = Int(readLine()!)!
        currentWeight -= lossWeight
        week += 1
    }
    print("\(currentWeight)kg 달성! 축하합니다!")
}

func while05() {
    let userID = "Hello"
    let userPW = 1234
    
    var isCorrect = true
    
    repeat {
        print("아이디를 입력해 주세요: ", terminator: "")
        let inputID = readLine()!
        print("비밀번호를 입력해 주세요: ", terminator: "")
        let inputPW = Int(readLine()!)!
        
        if (userID == inputID) && (userPW == inputPW) {
            isCorrect = false
            print("로그인 성공!")
            break
        }
        print("아이디와 비밀번호가 잘못되었습니다.")
        retry()
    } while isCorrect
    
    func retry(){
        print("다시 시도하시겠습니까? (Y/N): ", terminator: "")
        let yesOrNo = readLine()!
        switch yesOrNo {
        case "y", "Y":
            return
        case "n", "N":
            isCorrect = false
            return
        default:
            print("잘못입력하셨습니다.")
            retry()
        }
    }
}


while05()


//func while6(){
//    print("첫 번째 정수를 입력하세요: ", terminator: "")
//    let num1 = Int(readLine()!)!
//    print("두 번째 정수를 입력하세요: ", terminator: "")
//    let num2 = Int(readLine()!)!
//    
//    var result: Int
//    
//    print("1.더하기 2.빼기 : ", terminator: "")
//    let selection = Int(readLine()!)!
//    select()
//    
//    func select(){
//        switch selection {
//        case 1:
//            result = num1 + num2
//        case 2:
//            result = num1 - num2
//        default:
//            print("잘못입력하셨습니다.")
//            select()
//        }
//    }
//}


