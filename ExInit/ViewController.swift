//
//  ViewController.swift
//  ExInit
//
//  Created by 김종권 on 2023/04/30.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number = Number(rawValue: 0)
        print(number) // one
    }
}

enum Number: Int {
    case one
    case two
    case three
}

enum SomeEnum {
    case a(Int) // Error: Enum with raw type cannot have cases with arguments
}

struct SomeStruct {
    
}

// enum은 Raw Type을 갖게 되면 associated type 을 갖을 수 없지만 extension으로 따로 RawPresntable을 준수하기가 가능
enum Fruit {
    case apple(SomeStruct)
    case banana
    case etc
}

extension Fruit: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .apple:
            return "apple"
        case .banana:
            return "banana"
        case .etc:
            return "etc"
        }
    }
    
    init(rawValue: String) {
        switch rawValue {
        case "apple": self = .apple(SomeStruct())
        case "banan": self = .banana
        default: self = .etc
        }
    }
}

