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
        Objem!.delegate = self
        Skoroct!.delegate = self
    }
    
    @IBOutlet weak var Objem: UITextField?
    @IBOutlet weak var Skoroct: UITextField?
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var skorSegControl: UISegmentedControl!
    @IBOutlet weak var objemSkachControl: UISegmentedControl!
    
    @IBAction func Raschet(sender: UIButton) {
        Result.text = ""
        var printLabel: String = " "
        var sec: UInt64
        var min: UInt64
        var chas: UInt64
        var den: UInt64
        var obyemSkachD: Double
        var objemSkachS: String
        var skorSoedD: Double
        var skorSoedS: String
        var vremPeremO = ""
        var vremPeremOCh: Character
        var vremPeremS = ""
        var vremPeremSCh: Character
        if Objem!.text! == "" || Skoroct!.text! == "" {
            // Сделать Alert
            Result.text = "Вы не ввели данные!!!"
        } else {
            // Проверка на запятую
            objemSkachS = Objem!.text!
            skorSoedS = Skoroct!.text!
            for var vremPeremOCh in objemSkachS.characters {
                if vremPeremOCh == "," {
                    vremPeremOCh = "."
                }
                vremPeremO += String(vremPeremOCh)
            }
            obyemSkachD = Double(vremPeremO)!
            for var vremPeremSCh in skorSoedS.characters {
                if vremPeremSCh == "," {
                    vremPeremSCh = "."
                }
                vremPeremS += String(vremPeremSCh)
            }
            skorSoedD = Double(vremPeremS)!
            
        // Перевод единиц измерения в байты
        func perevodVByte(obyem: Double, _ velich: Int) -> Double {
            var tObyem = obyem
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
            return tObyem
        }
        
        func printTime(sec: UInt64) {
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
            func tMin(sec: UInt64) -> UInt64 {
                var tSec = min * 60
                tSec = sec - tSec
                return tSec
            }
            
            // Подсчёт часов
            func tChas(min: UInt64) -> UInt64 {
                var tMin = chas * 60
                tMin = min - tMin
                return tMin
            }
            
            // Подсчёт дней
            func tDni(chas: UInt64) -> UInt64 {
                var tChas = dni * 24
                tChas = chas - tChas
                return tChas
            }
            
            // Подсчёт месяцев
            func tMes(dni: UInt64) -> UInt64 {
                var tDni = mes * 30
                tDni = dni - tDni
                return tDni
            }
            
            // Подсчёт лет
            func tGod(mes: UInt64) -> UInt64 {
                var tMes = god * 12
                tMes = mes - tMes
                return tMes
            }
            
            // Отображение секунд
            func fSec(sec: UInt64) -> String {
                switch sec {
                case 1..<60:
                    if result == array1.contains(Int(sec)) {
                        printSec = "\(sec) секунда"
                        return printSec
                    } else if result == array2.contains(Int(sec)) {
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
            func fMin(min: UInt64, _ sec: UInt64) -> (String, UInt64) {
                let tSec = tMin(sec)
                switch min {
                case 1..<60:
                    if result == array1.contains(Int(min)) {
                        printMin = "\(min) минута "
                        return (printMin, tSec)
                    } else if result == array2.contains(Int(min)) {
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
            func fChas(chas: UInt64, _ min: UInt64) -> (String, UInt64) {
                let tMin = tChas(min)
                switch chas {
                case 1..<24:
                    if result == array1.contains(Int(chas)) {
                        printChas = "\(chas) час "
                        return (printChas, tMin)
                    } else if result == array2.contains(Int(chas)) {
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
            func fDni(dni: UInt64, _ chas: UInt64) -> (String, UInt64) {
                let tChas = tDni(chas)
                switch dni {
                case 1..<31:
                    if result == array1.contains(Int(dni)) {
                        printDni = "\(dni) день "
                        return (printDni, tChas)
                    } else if result == array2.contains(Int(dni)) {
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
            func fMes(mes: UInt64, _ dni: UInt64) -> (String, UInt64) {
                let tDni = tMes(dni)
                switch mes {
                case 1..<31:
                    if result == array1.contains(Int(mes)) {
                        printMes = "\(mes) месяц "
                        return (printMes, tDni)
                    } else if result == array2.contains(Int(mes)) {
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
            func fGod(god: UInt64, _ mes: UInt64) -> (String, UInt64) {
                let tMes = tGod(mes)
                switch god {
                case 1...100:
                    if result == array1.contains(Int(god)) {
                        printGod = "\(god) год "
                        return (printGod, tMes)
                    } else if result == array2.contains(Int(god)) {
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
                printLabel = printText
                print(printText)
            } else if god >= 100 {
                printText += "займёт больше 100 лет!!!"
                printLabel = printText
                print(printText)
                
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
            print("Скорость очень маленькая, \(skorSoedD) Byte/сек")
            sec = UInt64(obyemSkachD  / skorSoedD)
            printTime(sec)
        case 1:  //Kbyte
            print("Скорость скачивания \(skorSoedD) kByte/сек")
            sec = UInt64(obyemSkachD / 1024 / skorSoedD)
            printTime(sec)
        case 2:  //Mbyte
            print("Скорость скачивания \(skorSoedD) MByte/сек")
            sec = UInt64(obyemSkachD / 1024 / 1024 / skorSoedD)
            printTime(sec)
        default:
            break
        }
        Result.text = printLabel
      }
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

