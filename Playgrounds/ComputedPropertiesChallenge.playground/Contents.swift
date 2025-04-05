import Foundation

var width: Float = 3.4
var height: Float = 2.1

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoverdedPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoverdedPerBucket
        let roundBuckets = ceilf(numberOfBuckets)
        return Int(roundBuckets)
    
    }
    set {
        print("This amount of paint can cover an area of \(Double(newValue) * 1.5) square meters")
    }
}
bucketsOfPaint = 4
print(bucketsOfPaint)
