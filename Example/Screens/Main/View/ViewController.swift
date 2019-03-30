import UIKit
import SnapKit
import Source

/// Main screen controller
///
/// - Author: dmitry.volosach@gmail.com
class ViewController: UIViewController {
    private weak var someView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonA = UIButton()
        buttonA.setTitle("A", for: .normal)
        buttonA.setTitleColor(.blue, for: .normal)
        buttonA.addTarget(self, action: #selector(onButtonAPress(_:)), for: .touchUpInside)
        view.addSubview(buttonA)

        buttonA.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100.0)
            make.leading.equalToSuperview().offset(50.0)
        }
        
        let buttonB = UIButton()
        buttonB.setTitle("B", for: .normal)
        buttonB.setTitleColor(.blue, for: .normal)
        buttonB.addTarget(self, action: #selector(onButtonBPress(_:)), for: .touchUpInside)
        view.addSubview(buttonB)
        
        buttonB.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100.0)
            make.trailing.equalToSuperview().offset(-50.0)
        }
    }
    
    @objc private func onButtonAPress(_ sender: UIButton) {
        buildSomeView(SomeViewLayoutArrangerA())
    }
    
    @objc private func onButtonBPress(_ sender: UIButton) {
        buildSomeView(SomeViewLayoutArrangerB())
    }
    
    private func buildSomeView(_ layoutArranger: LayoutArranger) {
        self.someView?.removeFromSuperview()
        
        let model = SomeViewLayoutModel()
        
        let builder = DefaultViewBuilder()
        builder.set(layoutModel: model)
        builder.set(layoutPlacer: SomeViewLayoutPlacer())
        builder.set(layoutArranger: layoutArranger)
        
        let someView = builder.build()
        view.addSubview(someView)
        self.someView = someView
        
        someView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        let mediator = SomeViewMediator(layoutModel: model)
        mediator.set(firstTitle: "First Title")
        mediator.set(secondTitle: "Second Title")
        mediator.set(thirdTitle: "Third Title")
    }
}

