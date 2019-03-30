import UIKit

/// Builds the `UIView`
///
/// - Author: dmitry.volosach@gmail.com
public protocol ViewBuilder {
    /// Assigns layout model to use
    ///
    /// - Parameter layoutModel: Layout model to place
    func set(layoutModel: LayoutModel)
    
    /// Assigns layout placer to use
    ///
    /// - Parameter layoutPlacer: Placer of ther layout model
    func set(layoutPlacer: LayoutPlacer)
    
    /// Assigns layout arranger to use
    ///
    /// - Parameter layoutArranger: Arranger of the layout model
    func set(layoutArranger: LayoutArranger)
    
    /// Builds the view using layout model, placer and arranger
    ///
    /// - Returns: View built
    func build() -> UIView
}
