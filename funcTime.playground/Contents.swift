let sec = 1

func printTime(sec: Int) {
    let tempTime = sec
    let result = true
    var printText = "Время скачивания файла "
    let arrayOne = [1, 21, 31, 41, 51]
    let arrayTwo = [2, 3, 4, 22, 32, 42, 52, 23, 33, 43, 53, 24, 34, 44, 54]
    
    if sec == 0 {
        printText += "меньше секунды"
    }
    if tempTime > 0 && tempTime < 60 {
        if result == arrayOne.contains(tempTime) {
            print("\(printText)\(tempTime) секунда")
        } else if result == arrayTwo.contains(tempTime) {
            print("\(printText)\(tempTime) секунды")
        } else {
            print("\(printText)\(tempTime) секунд")
        }
        printText +=  String(tempTime)
    }
    print(printText)
}

printTime(sec)
