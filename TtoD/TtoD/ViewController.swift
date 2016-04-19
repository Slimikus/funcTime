//
//  ViewController.swift
//  TtoD
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Objem.delegate = self
        Skoroct.delegate = self
        
    }
    
    @IBOutlet weak var Objem: UITextField!
    @IBOutlet weak var Skoroct: UITextField!
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var skorSegControl: UISegmentedControl!
    @IBOutlet weak var objemSkachControl: UISegmentedControl!
    
    @IBAction func Raschet(sender: UIButton) {
        
        var printLabel: String = ""
        var sec: Int
        var min: Int
        var chas: Int
        var den: Int
        var obyemSkachD: Double = Double(Objem.text!)!
       // let obyemSkachE = "Gb"
        var obyemSkach: (Double, String)
        var skorSoedD: Double = Double(Skoroct.text!)!
       
      //  obyemSkach = (obyemSkachD, obyemSkachE)
        print(skorSegControl.selectedSegmentIndex)
        
        // Перевод единиц измерения в байты
        func perevodVByte(obyem: Double, _ velich: Int) -> Double {
            var tObyem = obyem
           // var tVelich = velich
            switch objemSkachControl.selectedSegmentIndex {
            case 0: //byte
                print("Объём файла \(tObyem) byte")
            case 1: //Kb
                print("Объём файла \(tObyem) Kb")
                tObyem = tObyem * 1024
            case 2: //Mb
                print("Объём файла \(tObyem) Mb")
                tObyem = tObyem * 1024 * 1024
            case 3: //Gb
                print("Объём файла \(tObyem) Gb")
                tObyem = tObyem * 1024 * 1024 * 1024
            case 4: //Tb
                print("Объём файла \(obyem) Tb")
                tObyem = tObyem * 1024 * 1024 * 1024 * 1024
            default:
                break
            }
           // tVelich = "byte"
            return tObyem
        }
        
        func printTime(sec: Int) {
            var min = sec / 60
            var chas = min / 60
            var dni = chas / 24
            var mes = dni / 30
            var god = mes / 12
            let result = true
            var printText = "Время скачивания файла "
            var printSec = ""
            var printMin = ""
            var printChas = ""
            var printDni = ""
            var printMes = ""
            var printGod = ""
            let array1 = [1, 21, 31, 41, 51, 61, 71, 81, 91]
            let array2 = [2, 3, 4, 22, 32, 42, 52, 23, 33, 43, 53, 24, 34, 44, 54, 62, 63, 64, 72, 73, 74, 82, 83, 84, 92, 93, 94]
            
            // Подсчёт минут
            func tMin(sec: Int) -> Int {
                var tSec = min * 60
                tSec = sec - tSec
                return tSec
            }
            
            // Подсчёт часов
            func tChas(min: Int) -> Int {
                var tMin = chas * 60
                tMin = min - tMin
                return tMin
            }
            
            // Подсчёт дней
            func tDni(chas: Int) -> Int {
                var tChas = dni * 24
                tChas = chas - tChas
                return tChas
            }
            
            // Подсчёт месяцев
            func tMes(dni: Int) -> Int {
                var tDni = mes * 30
                tDni = dni - tDni
                return tDni
            }
            
            // Подсчёт лет
            func tGod(mes: Int) -> Int {
                var tMes = god * 12
                tMes = mes - tMes
                return tMes
            }
            
            // Отображение секунд
            func fSec(sec: Int) -> String {
                switch sec {
                case 1..<60:
                    if result == array1.contains(sec) {
                        printSec = "\(sec) секунда"
                        return printSec
                    } else if result == array2.contains(sec) {
                        printSec = "\(sec) секунды"
                        return printSec
                    } else {
                        printSec = "\(sec) секунд"
                        return printSec
                    }
                default:
                    break
                }
                return printSec
            }
            
            // Отбражение минут
            func fMin(min: Int, _ sec: Int) -> (String, Int) {
                let tSec = tMin(sec)
                switch min {
                case 1..<60:
                    if result == array1.contains(min) {
                        printMin = "\(min) минута "
                        return (printMin, tSec)
                    } else if result == array2.contains(min) {
                        printMin = "\(min) минуты "
                        return (printMin, tSec)
                    } else {
                        printMin = "\(min) минут "
                        return (printMin, tSec)
                    }
                default:
                    break
                }
                return (printMin, tSec)
            }
            
            // Отображение часов
            func fChas(chas: Int, _ min: Int) -> (String, Int) {
                let tMin = tChas(min)
                switch chas {
                case 1..<24:
                    if result == array1.contains(chas) {
                        printChas = "\(chas) час "
                        return (printChas, tMin)
                    } else if result == array2.contains(chas) {
                        printChas = "\(chas) часа "
                        return (printChas, tMin)
                    } else {
                        printChas = "\(chas) часов "
                        return (printChas, tMin)
                    }
                default:
                    break
                }
                return (printChas, tMin)
            }
            
            // Отображение дней
            func fDni(dni: Int, _ chas: Int) -> (String, Int) {
                let tChas = tDni(chas)
                switch dni {
                case 1..<31:
                    if result == array1.contains(dni) {
                        printDni = "\(dni) день "
                        return (printDni, tChas)
                    } else if result == array2.contains(dni) {
                        printDni = "\(dni) дня "
                        return (printDni, tChas)
                    } else {
                        printDni = "\(dni) дней "
                        return (printDni, tChas)
                    }
                default:
                    break
                }
                return (printDni, tChas)
            }
            
            // Отображение  месяцев
            func fMes(mes: Int, _ dni: Int) -> (String, Int) {
                let tDni = tMes(dni)
                switch mes {
                case 1..<31:
                    if result == array1.contains(mes) {
                        printMes = "\(mes) месяц "
                        return (printMes, tDni)
                    } else if result == array2.contains(mes) {
                        printMes = "\(mes) месяца "
                        return (printMes, tDni)
                    } else {
                        printMes = "\(mes) месяцев "
                        return (printMes, tDni)
                    }
                default:
                    break
                }
                return (printMes, tDni)
            }
            
            // Отображение  лет
            func fGod(god: Int, _ mes: Int) -> (String, Int) {
                let tMes = tGod(mes)
                switch god {
                case 1...100:
                    if result == array1.contains(god) {
                        printGod = "\(god) год "
                        return (printGod, tMes)
                    } else if result == array2.contains(god) {
                        printGod = "\(god) года "
                        return (printGod, tMes)
                    } else {
                        printGod = "\(god) лет "
                        return (printGod, tMes)
                    }
                default:
                    break
                }
                return (printGod, tMes)
            }
            
            // Вывод на экран до 1 секунды
            if sec < 1 {
                printText += "меньше секунды"
                print(printText)
            } else if god >= 100 {
                print(printText + "займёт больше 100 лет!!!")
                
                // Вывод на экран от 1 секунды до 100 лет
            } else {
                let tMes = fGod(god, mes)
                let tDni = fMes(tMes.1, dni)
                let tChas = fDni(tDni.1, chas)
                let tMin = fChas(tChas.1, min)
                let tSec = fMin(tMin.1, sec)
                fSec(tSec.1)
                print(printText + printGod + printMes + printDni + printChas + printMin + printSec)
                printLabel = printText + printGod + printMes + printDni + printChas + printMin + printSec
            }
        }
        
        obyemSkachD = perevodVByte(obyemSkachD, objemSkachControl.selectedSegmentIndex)
        
        // расчёт в зависивости от единиц измерения скорости
        switch skorSegControl.selectedSegmentIndex {
        case 0:  //byte
            print("Скорость очень маленькая")
            sec = Int(obyemSkachD  / skorSoedD)
            printTime(sec)
        case 1:  //Kbyte
            print("Скорость скачивания \(skorSoedD) kByte/сек")
            sec = Int(obyemSkachD / 1024 / skorSoedD)
            printTime(sec)
        case 2:  //Mbyte
            print("Скорость скачивания \(skorSoedD) MByte/сек")
            sec = Int(obyemSkachD / 1024 / 1024 / skorSoedD)
            printTime(sec)
        default:
            break
        }
        Result.text = printLabel
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        if touch == touches.first! as UITouch! {
            view.endEditing(true)
        }
        super.touchesBegan(touches, withEvent: event)
    }

   
}

