# ViewBuilder
A small architecture pattern for view building

# Preview

`ViewBuilder` is an architectural pattern that can help you to make your views _adaptive_ by design. By "_adaptiveness_" I mean that view can easily adapt to changing specification.

The main idea is to namely **stop subclassing the `UIView` class** for creating your own views by using the [view builder](/Source/Core/ViewBuilder.swift) interface implementation, that uses proper [layout model](/Source/Core/LayoutModel.swift), [layout placer](/Source/Core/LayoutPlacer.swift) and [layout arranger](/Source/Core/LayoutArranger.swift) to build, construct and layout your view according to design. When the specification changes, you can just add new type of your layout model/placer/arranger and pass it to the builder.

## Getting started

These instructions will get you a copy of the project and will allow you running it on your local machine for development and testing purposes. See [Deployment](#Deployment) for notes on how to deploy the project on a live system.

### Prerequisites

- iOS 10.0+
- Xcode 10.0+
- Swift 4.2

### Installing

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `ViewBuilder` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '10.0'

source 'https://github.com/CocoaPods/Specs.git'

target '<Your Target Name>' do
    use_frameworks!

    pod 'UIViewBuilder', '<release version>'
end
```

Then, run the following command:

```bash
$ pod install --repo-update
```

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate `ViewBuilder` into your project manually by running:

```bash
git clone https://github.com/gitvalue/ViewBuilder.git
```

and importing the [sources](./Source/Core/) by hand.

## Deployment

Here you will see how to deploy the project on the live system.

### Quick Start

When using `ViewBuilder` you create a layout model, placer and the arranger to build your view.

*Layout model* is a structure that holds all the subviews forming your view, configured in a right manner:

```swift
///
/// Set of subviews forming the `SomeView`
///
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
```

*Layout placer* is an object that knows how to place the subviews forming your view in the subview hierarchy properly:

```swift
///
/// Placer of the `SomeView` subviews
///
class SomeViewLayoutPlacer: LayoutPlacer {
    func place(layoutModel: LayoutModel, onView view: UIView) {
        guard let layoutModel = layoutModel as? SomeViewLayoutModel else { return }
        
        view.addSubview(layoutModel.firstLabel)
        view.addSubview(layoutModel.secondLabel)
        view.addSubview(layoutModel.thirdLabel)
    }
}
```

Finally, *Layout Arranger* is an object that knows how to properly place the subviews forming your view in the coordinate space:

```swift
import UIKit
import SnapKit

///
/// Arranges the subviews forming the `SomeView` by the 'A' version
///
class SomeViewLayoutArranger: LayoutArranger {
    func arrange(layoutModel: LayoutModel, inView view: UIView) {
        guard let layoutModel = layoutModel as? SomeViewLayoutModel else { return }
        
        layoutModel.firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
        
        layoutModel.secondLabel.snp.makeConstraints { make in
            make.top.equalTo(layoutModel.firstLabel.snp.bottom).offset(10.0)
            make.centerX.equalToSuperview()
        }
        
        layoutModel.thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(layoutModel.secondLabel.snp.bottom).offset(10.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10.0)
        }
    }
}
```

Now, all we need to do to create our view is to pass instances of classes above to the builder:

```swift
let model = SomeViewLayoutModel()
        
let builder: ViewBuilder = DefaultViewBuilder()
builder.set(layoutModel: model)
builder.set(layoutPlacer: SomeViewLayoutPlacer())
builder.set(layoutArranger: SomeViewLayoutArranger())

let someView = builder.build()
```

## Versioning

This repo uses [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/gitvalue/ViewBuilder/releases).

## Contributing

Feel free to make any improvements needed by developing them in separate feature-branch and creating a pull-request with [Dmitry Volosach](dmitry.volosach@gmail.com) as a reviewer.

## Troubleshooting

For any questions please fell free to contact [Dmitry Volosach](dmitry.volosach@gmail.com).

## Authors

* **Dmitry Volosach** - *Initial work* - dmitry.volosach@gmail.com


