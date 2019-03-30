import UIKit

/// View's layout elements arranger
///
/// - Author: dmitry.volosach@gmail.com
public protocol LayoutArranger {
    /// Layouts view's subviews
    ///
    /// - Parameters:
    ///   - layoutModel: View's layout model, i.e. set of subviews forming the view
    ///   - view: View to be layouted
    func arrange(layoutModel: LayoutModel, inView view: UIView)
}
