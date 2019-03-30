import UIKit
import Source

/// Placer of the `SomeView` subviews
///
/// - Author: dmitry.volosach@gmail.com
class SomeViewLayoutPlacer: LayoutPlacer {
    func place(layoutModel: LayoutModel, onView view: UIView) {
        guard let layoutModel = layoutModel as? SomeViewLayoutModel else { return }
        
        view.addSubview(layoutModel.firstLabel)
        view.addSubview(layoutModel.secondLabel)
        view.addSubview(layoutModel.thirdLabel)
    }
}
