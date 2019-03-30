import UIKit
import SnapKit
import Source

/// Arranges the subviews forming the `SomeView` by the 'B' version
///
/// - Author: dmitry.volosach@gmail.com
class SomeViewLayoutArrangerB: LayoutArranger {
    func arrange(layoutModel: LayoutModel, inView view: UIView) {
        guard let layoutModel = layoutModel as? SomeViewLayoutModel else { return }
        
        layoutModel.firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
        
        layoutModel.thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(layoutModel.firstLabel.snp.bottom).offset(10.0)
            make.centerX.equalToSuperview()
        }
        
        layoutModel.secondLabel.snp.makeConstraints { make in
            make.top.equalTo(layoutModel.thirdLabel.snp.bottom).offset(10.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10.0)
        }
    }
}
