let sec = 3599

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
    let arrayOne = [1, 21, 31, 41, 51]
    let arrayTwo = [2, 3, 4, 22, 32, 42, 52, 23, 33, 43, 53, 24, 34, 44, 54]
    
    // Подсчёт минут
    func tMin(sec: Int) -> Int {
        var tSec = min * 60
        tSec = sec - tSec
        return tSec
    }
    
    // Отображение секунд
    func fSec(sec: Int) -> String {
        switch sec {
        case 1..<60:
            if result == arrayOne.contains(sec) {
                printSec = "\(sec) секунда"
                return printSec
            } else if result == arrayTwo.contains(sec) {
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
            if result == arrayOne.contains(min) {
                printMin = "\(min) минута "
                return (printMin, tSec)
            } else if result == arrayTwo.contains(min) {
                printMin = "\(min) минуты "
                return (printMin, tSec)
            } else {
                printMin = "\(min) минут "
                return (printMin, tSec)
            }
            tMin(sec)
            printText +=  String(tempTime)
        default:
            break
        }
        return (printMin, sec)
    }
    
    // Вывод на экран до 1 секунды
    if sec < 1 {
        printText += "меньше секунды"
    }
    
    // Выдод на экран от 1 до 59 секунд
    if sec > 1 && sec < 60 {
        fSec(sec)
        print(printText + printSec)
        
        // Вывод на экран от 1 до 59 минут
    } else if min < 60 {
        let tSec = fMin(min, sec)
        fSec(tSec.1)
        print(printText + printMin + fSec(tSec.1))
    }
    
    print("Test: \(printText)\(sec) секунд")
}

// Запуск функции
printTime(sec)
