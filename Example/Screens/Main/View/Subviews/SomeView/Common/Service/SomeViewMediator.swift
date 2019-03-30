import UIKit

/// Mediates the access to `SomeView`
///
/// - Author: dmitry.volosach@gmail.com
class SomeViewMediator {
    private let layoutModel: SomeViewLayoutModel
    
    /// The designated initializer
    ///
    /// - Parameter layoutModel: Layout model of the view
    init(layoutModel: SomeViewLayoutModel) {
        self.layoutModel = layoutModel
    }
    
    /// Sets the first title text
    ///
    /// - Parameter firstTitle: Text of the title
    func set(firstTitle: String) {
        layoutModel.firstLabel.text = firstTitle
    }
    
    /// Sets the second title text
    ///
    /// - Parameter secondTitle: Text of the title
    func set(secondTitle: String) {
        layoutModel.secondLabel.text = secondTitle
    }
    
    /// Sets the third title text
    ///
    /// - Parameter thirdTitle: Text of the title
    func set(thirdTitle: String) {
        layoutModel.thirdLabel.text = thirdTitle
    }
}
