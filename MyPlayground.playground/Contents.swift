//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let time = "2016-07-11T11:14:25.109267Z"


let split = time.characters.split{$0 == "T"}.map(String.init)
split.first