import UIKit

/// Set of subviews forming the `SomeView`
///
/// - Author: dmitry.volosach@gmail.com
class SomeViewLayoutModel {
    /// First label
    let firstLabel: UILabel
    
    /// Second label
    let secondLabel: UILabel
    
    /// Third label
    let thirdLabel: UILabel
    
    /// The designated initializer
    init() {
        firstLabel = UILabel()
        firstLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        secondLabel = UILabel()
        secondLabel.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        thirdLabel = UILabel()
        thirdLabel.font = .systemFont(ofSize: 16.0, weight: .heavy)
    }
}
