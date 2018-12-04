import UIKit

extension Int {
    fileprivate func stringPadded(to count: Int) -> String {
        var string = String(self)
        while string.count < count { string = "0" + string }
        return string
    }
}

class Model {
    static let shared = Model()
    private init() {}
    
    enum Animation: String, CaseIterable {
        case bureaucrat = "Talking Bureaucrat"
        case frog = "Talking Frog"
        case ranger = "Talking Ranger"
        case vendor = "Talking Vendor"
        case bot = "Talking Woodbot"
    }
    
    private let cellCounts = [Animation.bureaucrat: 26, .frog: 62, .ranger: 86, .vendor: 36, .bot: 69]
    
    var characters: [Animation] {
        return Animation.allCases
    }
    
    // TODO: Implement
    func image(for character: Animation) -> UIImage {
        // RETURN THE 000 IMAGE FOR THE GIVEN CHARACTER HERE
        let imageName = "\(character)000"
        print(imageName)
        guard let image = UIImage(named: imageName) else {fatalError("Image did not load.(Model.image)")}
        return image
    }
    
    func cells(for character: Animation) -> [UIImage] {
        // RETURN AN ARRAY OF IMAGES FOR THE GIVEN CHARACTER HERE
        let coalesceImage = UIImage(named: "\(character.rawValue)000")
        var imageArray : [UIImage] = []
        guard let count = cellCounts[character] else {fatalError("Error")}
        for num in (0...count) {
            let imageName = "\(character.rawValue)\(num.stringPadded(to: 3))"
            imageArray.append((UIImage(named: imageName) ?? coalesceImage!))
        }
        return imageArray
    }

}
