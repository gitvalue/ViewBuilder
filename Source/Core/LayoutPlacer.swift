import UIKit

/// View subviews hierarchy builder
///
/// - Author: dmitry.volosach@gmail.com
public protocol LayoutPlacer {
    /// Adds the subviews on view
    ///
    /// - Parameters:
    ///   - layoutModel: Set of view's subviews
    ///   - view: View to place subviews on
    func place(layoutModel: LayoutModel, onView view: UIView)
}
