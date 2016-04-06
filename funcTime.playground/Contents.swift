let sec = 120

func printTime(sec: Int) {
    let tempTime = sec
    var min = sec / 60
    var chas = min / 60
    var dni = chas / 24
    var ned = dni / 7
    
    let result = true
    var printText = "Время скачивания файла "
    let arrayOne = [1, 21, 31, 41, 51]
    let arrayTwo = [2, 3, 4, 22, 32, 42, 52, 23, 33, 43, 53, 24, 34, 44, 54]
    
    func fSec(sec: Int) {
        switch sec {
        case 0:
            printText += "меньше секунды"
        case 1..<60:
            if result == arrayOne.contains(sec) {
                print("\(printText)\(sec) секунда")
            } else if result == arrayTwo.contains(sec) {
                print("\(printText)\(sec) секунды")
            } else {
                print("\(printText)\(sec) секунд")
            }
            printText +=  String(tempTime)
        default:
            break
        }
    }
    
    func fMin(min: Int) {
        switch min {
         case 1..<60:
            if result == arrayOne.contains(min) {
                print("\(printText)\(min) минута")
            } else if result == arrayTwo.contains(min) {
                print("\(printText)\(min) минуты")
            } else {
                print("\(printText)\(min) минут")
            }
            printText +=  String(tempTime)
        default:
            break
        }
    }
    
    if sec < 60 {
        fSec(sec)
    } else if min < 60 {
        fMin(min)
    }
    
    print("Test: \(printText) секунд")
}

printTime(sec)
