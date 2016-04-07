let sec = 86_401

func printTime(sec: Int) {
    let tempTime = sec
    var min = sec / 60
    var chas = min / 60
    var dni = chas / 24
    var ned = dni / 7
    
    let result = true
    var printText = "Время скачивания файла "
    var printSec = ""
    var printMin = ""
    var printChas = ""
    var printDni = ""
    var printNed = ""
    let array1 = [1, 21, 31, 41, 51]
    let array2 = [2, 3, 4, 22, 32, 42, 52, 23, 33, 43, 53, 24, 34, 44, 54]
    
    // Подсчёт минут
    func tMin(sec: Int) -> Int {
        var tSec = min * 60
        tSec = sec - tSec
        return tSec
    }
    
    // Подсчёт часов
    func tChas(min: Int) -> Int {
        min
        var tMin = chas * 60
        tMin = min - tMin
        return tMin
    }
    
    // Подсчёт дней
    func tDni(chas: Int) -> Int {
        chas
        var tChas = dni * 24
        tChas = chas - tChas
        return tChas
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
            sec
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
            
            printText +=  String(tempTime)
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
            printText +=  String(tempTime)
        default:
            break
        }
        return (printChas, tMin)
    }
    
    // Отображение дней
    func fDni(dni: Int, _ chas: Int) -> (String, Int) {
        let tChas = tDni(chas)
        switch dni {
        case 1..<24:
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
            printText +=  String(tempTime)
        default:
            dni
        }
        return (printDni, tChas)
    }
    
    // Вывод на экран до 1 секунды
    if sec < 1 {
        printText += "меньше секунды"
        print(printText)
        
        // Вывод на экран от 1 секунды до 24 часов
    } else {
        let tChas = fDni(dni, chas)
        fChas(tChas.1, min)
        let tMin = fChas(tChas.1, min)
        fMin(tMin.1, sec)
        let tSec = fMin(tMin.1, sec)
        fSec(tSec.1)
        print(printText + printDni + printChas + printMin + printSec)
    }
    
    print("Test: \(printText)\(sec) секунд")
}

// Запуск функции
printTime(sec)
