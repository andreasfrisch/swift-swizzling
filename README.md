# swift-swizzling
Example of hooking into UIView/Controllers to fetch DOM

Having defined a trivial app comprising some nested elements (Root view with title, image, and scrollview -- the scrollview itself having some content.):

![iPhone 6s emulator screenshot](https://github.com/andreasfrisch/swift-swizzling/blob/main/screenshot.png?raw=true)

We get the following output from our UIViewController Extension

```
<UILabel: 0x7f96dc4082c0; frame = (20 148; 374 45); text = 'Some Title'; opaque = NO; autoresize = RM+BM; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600002bf0230>>
[<NSLayoutConstraint:0x600002bf0190 UILabel:0x7f96dc4082c0.height == 45   (active)>]
<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
<_UILabelLayer:0x600002bf0230; position = CGPoint (207 170.5); bounds = CGRect (0 0; 374 45); delegate = <UILabel: 0x7f96dc4082c0; frame = (20 148; 374 45); text = 'Some Title'; opaque = NO; autoresize = RM+BM; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600002bf0230>>; allowsGroupOpacity = YES; contentsScale = 2; rasterizationScale = 2; contentsMultiplyColor = (null)>


<UIImageView: 0x7f96dc708b90; frame = (87 201; 240 128); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x600000890a80>>
[<NSLayoutConstraint:0x600002bf5f90 UIImageView:0x7f96dc708b90.height == 128   (active)>]
<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
<CALayer:0x600000890a80; position = CGPoint (207 265); bounds = CGRect (0 0; 240 128); delegate = <UIImageView: 0x7f96dc708b90; frame = (87 201; 240 128); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x600000890a80>>; masksToBounds = YES; allowsGroupOpacity = YES; backgroundColor = <CGColor 0x600002cdeca0> [<CGColorSpace 0x600002cd0cc0> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 0.345098 0.337255 0.839216 1 )>


<UIScrollView: 0x7f96db028c00; frame = (20 337; 374 525); clipsToBounds = YES; autoresize = RM+BM; gestureRecognizers = <NSArray: 0x6000006860d0>; layer = <CALayer: 0x600000890aa0>; contentOffset: {0, 0}; contentSize: {0, 0}; adjustedContentInset: {0, 0, 0, 0}>
[<NSLayoutConstraint:0x600002bf5db0 UIImageView:0x7f96dc709170.centerX == UIScrollView:0x7f96db028c00.centerX   (active)>, <NSLayoutConstraint:0x600002bf5e00 UIImageView:0x7f96dc709170.top == UIScrollView:0x7f96db028c00.topMargin   (active)>, <NSLayoutConstraint:0x600002bf5e50 UIImageView:0x7f96dc709170.trailing == UIScrollView:0x7f96db028c00.trailingMargin   (active)>, <NSLayoutConstraint:0x600002bf5ea0 UIImageView:0x7f96dc709170.leading == UIScrollView:0x7f96db028c00.leadingMargin   (active)>, <NSLayoutConstraint:0x600002bf5ef0 UIImageView:0x7f96dc709170.leading == UIImageView:0x7f96dc709350.leading   (active)>, <NSLayoutConstraint:0x600002bf59a0 UIImageView:0x7f96dc709170.trailing == UIImageView:0x7f96dc709350.trailing   (active)>, <NSLayoutConstraint:0x600002bf57c0 UIImageView:0x7f96dc709350.trailing == UIImageView:0x7f96dc709530.trailing   (active)>, <NSLayoutConstraint:0x600002bf5b30 V:[UIImageView:0x7f96dc709170]-(8)-[UIImageView:0x7f96dc709350]   (active)>, <NSLayoutConstraint:0x600002bf5bd0 UIImageView:0x7f96dc709350.leading == UIImageView:0x7f96dc709530.leading   (active)>, <NSLayoutConstraint:0x600002bf5c20 V:[UIImageView:0x7f96dc709530]-(-39)-|   (active, names: '|':UIScrollView:0x7f96db028c00 )>, <NSLayoutConstraint:0x600002bf5cc0 V:[UIImageView:0x7f96dc709350]-(8)-[UIImageView:0x7f96dc709530]   (active)>, <NSLayoutConstraint:0x600002bf6170 'UIScrollView-content-margins-bottom' _UIScrollViewLayoutGuide:0x600003195dc0'UIScrollView-contentLayoutGuide'.bottom == UILayoutGuide:0x600003195ce0'UIScrollViewContentMarginsGuide'.bottom + 8   (active)>, <NSLayoutConstraint:0x600002bf6120 'UIScrollView-content-margins-left' UILayoutGuide:0x600003195ce0'UIScrollViewContentMarginsGuide'.left == _UIScrollViewLayoutGuide:0x600003195dc0'UIScrollView-contentLayoutGuide'.left + 8   (active)>, <NSLayoutConstraint:0x600002bf61c0 'UIScrollView-content-margins-right' _UIScrollViewLayoutGuide:0x600003195dc0'UIScrollView-contentLayoutGuide'.right == UILayoutGuide:0x600003195ce0'UIScrollViewContentMarginsGuide'.right + 8   (active)>, <NSLayoutConstraint:0x600002bf5d60 'UIScrollView-content-margins-top' UILayoutGuide:0x600003195ce0'UIScrollViewContentMarginsGuide'.top == _UIScrollViewLayoutGuide:0x600003195dc0'UIScrollView-contentLayoutGuide'.top + 8   (active)>, <NSLayoutConstraint:0x600002bf5ae0 'UIScrollView-contentLayoutGuide-minX' H:|-(0)-[_UIScrollViewLayoutGuide:0x600003195dc0'UIScrollView-contentLayoutGuide'](LTR)   (active, names: '|':UIScrollView:0x7f96db028c00 )>, <NSLayoutConstraint:0x600002bf5b80 'UIScrollView-contentLayoutGuide-minY' V:|-(0)-[_UIScrollViewLayoutGuide:0x600003195dc0'UIScrollView-contentLayoutGuide']   (active, names: '|':UIScrollView:0x7f96db028c00 )>]
<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
<CALayer:0x600000890aa0; position = CGPoint (207 599.5); bounds = CGRect (0 0; 374 525); delegate = <UIScrollView: 0x7f96db028c00; frame = (20 337; 374 525); clipsToBounds = YES; autoresize = RM+BM; gestureRecognizers = <NSArray: 0x6000006860d0>; layer = <CALayer: 0x600000890aa0>; contentOffset: {0, 0}; contentSize: {0, 0}; adjustedContentInset: {0, 0, 0, 0}>; sublayers = (<CALayer: 0x600000890980>, <CALayer: 0x6000008909e0>, <CALayer: 0x600000890b40>, <CALayer: 0x600000890f60>, <CALayer: 0x600000890c20>); opaque = YES; masksToBounds = YES; allowsGroupOpacity = YES; >


	<UIImageView: 0x7f96dc709170; frame = (8 8; 358 180); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x600000890980>>
	[<NSLayoutConstraint:0x600002bf5fe0 UIImageView:0x7f96dc709170.height == 180   (active)>]
	<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
	<CALayer:0x600000890980; position = CGPoint (187 98); bounds = CGRect (0 0; 358 180); delegate = <UIImageView: 0x7f96dc709170; frame = (8 8; 358 180); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x600000890980>>; masksToBounds = YES; allowsGroupOpacity = YES; backgroundColor = <CGColor 0x600002cdebe0> [<CGColorSpace 0x600002cd0cc0> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 1 0.584314 0 1 )>


	<UIImageView: 0x7f96dc709350; frame = (8 196; 358 180); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x6000008909e0>>
	[<NSLayoutConstraint:0x600002bf6030 UIImageView:0x7f96dc709350.height == 180   (active)>]
	<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
	<CALayer:0x6000008909e0; position = CGPoint (187 286); bounds = CGRect (0 0; 358 180); delegate = <UIImageView: 0x7f96dc709350; frame = (8 196; 358 180); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x6000008909e0>>; masksToBounds = YES; allowsGroupOpacity = YES; backgroundColor = <CGColor 0x600002cde7c0> [<CGColorSpace 0x600002cd0cc0> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 1 0.176471 0.333333 1 )>


	<UIImageView: 0x7f96dc709530; frame = (8 384; 358 180); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x600000890b40>>
	[<NSLayoutConstraint:0x600002bf5f40 UIImageView:0x7f96dc709530.height == 180   (active)>]
	<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
	<CALayer:0x600000890b40; position = CGPoint (187 474); bounds = CGRect (0 0; 358 180); delegate = <UIImageView: 0x7f96dc709530; frame = (8 384; 358 180); clipsToBounds = YES; autoresize = RM+BM; userInteractionEnabled = NO; layer = <CALayer: 0x600000890b40>>; masksToBounds = YES; allowsGroupOpacity = YES; backgroundColor = <CGColor 0x600002cde820> [<CGColorSpace 0x600002cd0cc0> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 0.686275 0.321569 0.870588 1 )>


	<_UIScrollViewScrollIndicator: 0x7f96dc70a850; frame = (364 519; 7 3); alpha = 0; autoresize = TM; layer = <CALayer: 0x600000890f60>>
	[]
	<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
	<CALayer:0x600000890f60; position = CGPoint (367.5 520.5); bounds = CGRect (0 0; 7 3); delegate = <_UIScrollViewScrollIndicator: 0x7f96dc70a850; frame = (364 519; 7 3); alpha = 0; autoresize = TM; layer = <CALayer: 0x600000890f60>>; sublayers = (<CALayer: 0x600000890f80>); opaque = YES; allowsGroupOpacity = YES; opacity = 0; zPosition = 1000>


		<UIView: 0x7f96dc70abf0; frame = (0 0; 0 0); layer = <CALayer: 0x600000890f80>>
		[]
		<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
		<CALayer:0x600000890f80; position = CGPoint (0 0); bounds = CGRect (0 0; 0 0); delegate = <UIView: 0x7f96dc70abf0; frame = (0 0; 0 0); layer = <CALayer: 0x600000890f80>>; allowsGroupOpacity = YES; continuousCorners = YES; backgroundColor = <CGColor 0x600002bf6210> [<CGColorSpace 0x600002cd63a0> (kCGColorSpaceICCBased; kCGColorSpaceModelMonochrome; Generic Gray Gamma 2.2 Profile; extended range)] ( 0 0.35 )>


	<_UIScrollViewScrollIndicator: 0x7f96dc70ad60; frame = (368 515; 3 7); alpha = 0; autoresize = LM; layer = <CALayer: 0x600000890c20>>
	[]
	<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
	<CALayer:0x600000890c20; position = CGPoint (369.5 518.5); bounds = CGRect (0 0; 3 7); delegate = <_UIScrollViewScrollIndicator: 0x7f96dc70ad60; frame = (368 515; 3 7); alpha = 0; autoresize = LM; layer = <CALayer: 0x600000890c20>>; sublayers = (<CALayer: 0x6000008910a0>); opaque = YES; allowsGroupOpacity = YES; opacity = 0; zPosition = 1000>


		<UIView: 0x7f96dc70af00; frame = (0 0; 0 0); layer = <CALayer: 0x6000008910a0>>
		[]
		<UITraitCollection: 0x6000031d01c0; UserInterfaceIdiom = Phone, DisplayScale = 2, DisplayGamut = sRGB, HorizontalSizeClass = Compact, VerticalSizeClass = Regular, UserInterfaceStyle = Light, UserInterfaceLayoutDirection = LTR, ForceTouchCapability = Available, PreferredContentSizeCategory = L, AccessibilityContrast = Normal, UserInterfaceLevel = Base>
		<CALayer:0x6000008910a0; position = CGPoint (0 0); bounds = CGRect (0 0; 0 0); delegate = <UIView: 0x7f96dc70af00; frame = (0 0; 0 0); layer = <CALayer: 0x6000008910a0>>; allowsGroupOpacity = YES; continuousCorners = YES; backgroundColor = <CGColor 0x600002bf6260> [<CGColorSpace 0x600002cd63a0> (kCGColorSpaceICCBased; kCGColorSpaceModelMonochrome; Generic Gray Gamma 2.2 Profile; extended range)] ( 0 0.35 )>


2022-04-29 09:39:28.172304+0200 BuenasTardes[7906:241497] [HardwareKeyboard] -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:], failed to fetch device property for senderID (778835616971358211) use primary keyboard info instead.
2022-04-29 09:39:28.176262+0200 BuenasTardes[7906:241497] [HardwareKeyboard] -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:], failed to fetch device property for senderID (778835616971358211) use primary keyboard info instead.
```
