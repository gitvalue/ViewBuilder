import UIKit

/// Default `UIView` builder
///
/// - Author: dmitry.volosach@gmail.com
public class DefaultViewBuilder: ViewBuilder {
    private var layoutModel: LayoutModel?
    private var layoutPlacer: LayoutPlacer?
    private var layoutArranger: LayoutArranger?
    
    /// The designated initializer
    public init() {
        // intentionally left blank
    }
    
    public func set(layoutModel: LayoutModel) {
        self.layoutModel = layoutModel
    }
    
    public func set(layoutPlacer: LayoutPlacer) {
        self.layoutPlacer = layoutPlacer
    }
    
    public func set(layoutArranger: LayoutArranger) {
        self.layoutArranger = layoutArranger
    }
    
    public func build() -> UIView {
        let result = UIView()
        
        if let layoutModel = layoutModel,
            let layoutPlacer = layoutPlacer,
            let layoutArranger = layoutArranger {
            layoutPlacer.place(layoutModel: layoutModel, onView: result)
            layoutArranger.arrange(layoutModel: layoutModel, inView: result)
        }
        
        return result
    }
}
