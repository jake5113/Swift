//
//  main.swift
//  Swift_Enumeration
//
//  Created by 이종원 on 10/17/23.
//

import Foundation

/*
 열거형 (Enumerations) p.111
 
 미리 정의된 값 집합으로 구성된 사용자 지정 데이터 유형

 (연관된 항목들을 묶어서 표현할 수 있는 타입)
 
 열거형은 일반적으로 switch 문을 사용할 떄와 같이
 코드 내에서 결정을 내릴 때 사용
 
 enum 열거형이름 {
    case ..
    case ..
    case ..
    ...
 }
 */
func ex01() {
    enum Temperature {
        case hot, warm, cold(centigratde: Int)
    }
    
    func displayTempInfo(temp: Temperature) {
        switch temp {
        case .hot:
            print("It is hot.")
        case .warm:
            print("It is warm.")
        case .cold(let centigrade) where centigrade <= 8:
            print("It is cold. \(centigrade) degrees.")
        case .cold:
            print("It is cold but not freezing.")
        }
    }
    
    displayTempInfo(temp: .hot)
    print(Temperature.hot)
    
    displayTempInfo(temp: Temperature.cold(centigratde: -10))
    displayTempInfo(temp: .cold(centigratde: 10))
    displayTempInfo(temp: .warm)
}

// Ex02
func ex02() {
    enum Animal {
        case dog(name: String), cat(name: String), bird(name: String)
    }
    
    func checkAnimal(animals: Animal) {
        switch animals {
        case .dog(let name):
            print("이 동물은 '개'고, 이름은 \(name)입니다.")
        case .cat(let name):
            print("이 동물은 '고양이'고, 이름은 \(name)입니다.")
        case .bird(let name):
            print("이 동물은 '새'고, 이름은 \(name)입니다.")
        }
    }
    
    checkAnimal(animals: .bird(name: "까치"))
    checkAnimal(animals: .dog(name: "찰떡이"))
    checkAnimal(animals: Animal.cat(name: "야옹이"))
}

func ex03() {
    enum Season {
        case spring, summer, autumn, winter, noSeason
    }
    
    func getSeason(date: (month: Int, day: Int)) -> Season {
        var season: Season
        
        switch date.month {
        case 3, 4, 5:
            season = .spring
        case 6, 7, 8:
            season =  .summer
        case 9, 10, 11:
            season =  .autumn
        case 12, 1, 2:
            season =  .winter
        default:
            return .noSeason
        }
        
        return season
    }
    
    let today = (month: 10, day: 17)
    let season = getSeason(date: today)
    
    print("오늘은 \(season)입니다.")
    print("오늘은 \( getSeason(date: (month: 6, day: 17)) )입니다.")
    print("오늘은 \( getSeason(date: (month: 12, day: 15)) )입니다.")
    print("오늘은 \( getSeason(date: (month: 3, day: 1)) )입니다.")
}

func ex04() {
    
    enum ArithOperators {
        case add, subtract, multiply, divide
    }
    
    func calculate(num1: Int, num2: Int, op: ArithOperators) -> Int {
        switch op {
        case .add:
            num1 + num2
        case .subtract:
            num1 - num2
        case .multiply:
            num1 * num2
        case .divide:
            num1 / num2
        }
    }
    
    let result = calculate(num1: 10, num2: 5, op: .divide)

    print("결과는 \(result)입니다.")      //결과는 2입니다.
    print("결과는 \( calculate(num1: 10, num2: 5, op: .add) )입니다.")        //결과는 15입니다.
    print("결과는 \( calculate(num1: 10, num2: 5, op: .subtract) )입니다.")   //결과는 5입니다.
    print("결과는 \( calculate(num1: 10, num2: 5, op: .multiply) )입니다.")   //결과는 50입니다.
}

func ex05() {
    enum Beverage {
        case coffee(price: Int), tea(price: Int), juice(price: Int)
    }
    
    func printTypeAndPrice(beverages: [Beverage]) {
        beverages.forEach { Beverage in
            switch Beverage {
            case .coffee(let price):
            print("이 음료는 커피이고 가격은 \(price)원입니다.")
            case .tea(let price):
                print("이 음료는 차이고 가격은 \(price)원입니다.")
            case .juice(let price):
                print("이 음료는 주스이고 가격은 \(price)원입니다.")
            }
        }
    }
    
    let beverages = [Beverage.coffee(price: 3000), Beverage.tea(price: 2000), Beverage.juice(price: 2500)]
    printTypeAndPrice(beverages: beverages)
}

func ex06() {
    enum Direction {
        case up, down, left, right
    }
    
    func move(position: (x: Int, y: Int), direction: Direction) -> (x: Int, y: Int) {
        switch direction {
        case .up:
            (position.x, position.y + 1)
        case .down:
            (position.x, position.y - 1)
        case .left:
            (position.x - 1, position.y)
        case .right:
            (position.x + 1, position.y)
        }
    }
    
    let currentPosition = (x: 0, y: 0)

    var nextPosition = move(position: currentPosition, direction: .right)
    print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (1, 0)입니다.

    nextPosition = move(position: currentPosition, direction: .left)
    print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (-1, 0)입니다.

    nextPosition = move(position: currentPosition, direction: .up)
    print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, 1)입니다.

    nextPosition = move(position: currentPosition, direction: .down)
    print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, -1)입니다.
}

func ex07() {
    enum Dice: Int {
        case one
        case two
        case three
        case four
        case five
        case six
    }
    
    func rollDice() -> Dice {
        [Dice.one, Dice.two, Dice.three, Dice.four, Dice.five, Dice.six].randomElement()!
    }
    let dice = rollDice()

    print("주사위의 면은 \(dice)입니다.")
}

func ex08() {
    enum Color {
        case red (r: Int, g: Int, b: Int)
        case green (r: Int, g: Int, b: Int)
        case blue (r: Int, g: Int, b: Int)
    }
    
    func printColors(colors: [Color]) {
        colors.forEach { Color in
            switch Color {
            case .red(let r, let g, let b):
                print("이 색상은 빨강이고 RGB 값은 (\(r),\(g),\(b)) 입니다.")
            case .green(let r, let g, let b):
                print("이 색상은 초록이고 RGB 값은 (\(r),\(g),\(b)) 입니다.")
            case .blue(let r, let g, let b):
                print("이 색상은 파랑이고 RGB 값은 (\(r),\(g),\(b)) 입니다.")
            }
        }
    }
    
    let colors = [Color.red(r: 255, g: 0, b: 0), Color.green(r: 0, g: 255, b: 0), Color.blue(r: 0, g: 0, b: 255)]
    printColors(colors: colors)
    
}

ex08()
