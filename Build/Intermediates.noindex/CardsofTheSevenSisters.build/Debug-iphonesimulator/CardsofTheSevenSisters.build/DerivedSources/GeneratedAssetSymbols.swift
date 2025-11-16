import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "LaunchScreenBackground" asset catalog color resource.
    static let launchScreenBackground = DeveloperToolsSupport.ColorResource(name: "LaunchScreenBackground", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "10c" asset catalog image resource.
    static let _10C = DeveloperToolsSupport.ImageResource(name: "10c", bundle: resourceBundle)

    /// The "10d" asset catalog image resource.
    static let _10D = DeveloperToolsSupport.ImageResource(name: "10d", bundle: resourceBundle)

    /// The "10h" asset catalog image resource.
    static let _10H = DeveloperToolsSupport.ImageResource(name: "10h", bundle: resourceBundle)

    /// The "10s" asset catalog image resource.
    static let _10S = DeveloperToolsSupport.ImageResource(name: "10s", bundle: resourceBundle)

    /// The "2c" asset catalog image resource.
    static let _2C = DeveloperToolsSupport.ImageResource(name: "2c", bundle: resourceBundle)

    /// The "2d" asset catalog image resource.
    static let _2D = DeveloperToolsSupport.ImageResource(name: "2d", bundle: resourceBundle)

    /// The "2h" asset catalog image resource.
    static let _2H = DeveloperToolsSupport.ImageResource(name: "2h", bundle: resourceBundle)

    /// The "2s" asset catalog image resource.
    static let _2S = DeveloperToolsSupport.ImageResource(name: "2s", bundle: resourceBundle)

    /// The "3c" asset catalog image resource.
    static let _3C = DeveloperToolsSupport.ImageResource(name: "3c", bundle: resourceBundle)

    /// The "3d" asset catalog image resource.
    static let _3D = DeveloperToolsSupport.ImageResource(name: "3d", bundle: resourceBundle)

    /// The "3h" asset catalog image resource.
    static let _3H = DeveloperToolsSupport.ImageResource(name: "3h", bundle: resourceBundle)

    /// The "3s" asset catalog image resource.
    static let _3S = DeveloperToolsSupport.ImageResource(name: "3s", bundle: resourceBundle)

    /// The "4c" asset catalog image resource.
    static let _4C = DeveloperToolsSupport.ImageResource(name: "4c", bundle: resourceBundle)

    /// The "4d" asset catalog image resource.
    static let _4D = DeveloperToolsSupport.ImageResource(name: "4d", bundle: resourceBundle)

    /// The "4h" asset catalog image resource.
    static let _4H = DeveloperToolsSupport.ImageResource(name: "4h", bundle: resourceBundle)

    /// The "4s" asset catalog image resource.
    static let _4S = DeveloperToolsSupport.ImageResource(name: "4s", bundle: resourceBundle)

    /// The "5c" asset catalog image resource.
    static let _5C = DeveloperToolsSupport.ImageResource(name: "5c", bundle: resourceBundle)

    /// The "5d" asset catalog image resource.
    static let _5D = DeveloperToolsSupport.ImageResource(name: "5d", bundle: resourceBundle)

    /// The "5h" asset catalog image resource.
    static let _5H = DeveloperToolsSupport.ImageResource(name: "5h", bundle: resourceBundle)

    /// The "5s" asset catalog image resource.
    static let _5S = DeveloperToolsSupport.ImageResource(name: "5s", bundle: resourceBundle)

    /// The "6c" asset catalog image resource.
    static let _6C = DeveloperToolsSupport.ImageResource(name: "6c", bundle: resourceBundle)

    /// The "6d" asset catalog image resource.
    static let _6D = DeveloperToolsSupport.ImageResource(name: "6d", bundle: resourceBundle)

    /// The "6h" asset catalog image resource.
    static let _6H = DeveloperToolsSupport.ImageResource(name: "6h", bundle: resourceBundle)

    /// The "6s" asset catalog image resource.
    static let _6S = DeveloperToolsSupport.ImageResource(name: "6s", bundle: resourceBundle)

    /// The "7c" asset catalog image resource.
    static let _7C = DeveloperToolsSupport.ImageResource(name: "7c", bundle: resourceBundle)

    /// The "7d" asset catalog image resource.
    static let _7D = DeveloperToolsSupport.ImageResource(name: "7d", bundle: resourceBundle)

    /// The "7h" asset catalog image resource.
    static let _7H = DeveloperToolsSupport.ImageResource(name: "7h", bundle: resourceBundle)

    /// The "7s" asset catalog image resource.
    static let _7S = DeveloperToolsSupport.ImageResource(name: "7s", bundle: resourceBundle)

    /// The "8c" asset catalog image resource.
    static let _8C = DeveloperToolsSupport.ImageResource(name: "8c", bundle: resourceBundle)

    /// The "8d" asset catalog image resource.
    static let _8D = DeveloperToolsSupport.ImageResource(name: "8d", bundle: resourceBundle)

    /// The "8h" asset catalog image resource.
    static let _8H = DeveloperToolsSupport.ImageResource(name: "8h", bundle: resourceBundle)

    /// The "8s" asset catalog image resource.
    static let _8S = DeveloperToolsSupport.ImageResource(name: "8s", bundle: resourceBundle)

    /// The "9c" asset catalog image resource.
    static let _9C = DeveloperToolsSupport.ImageResource(name: "9c", bundle: resourceBundle)

    /// The "9d" asset catalog image resource.
    static let _9D = DeveloperToolsSupport.ImageResource(name: "9d", bundle: resourceBundle)

    /// The "9h" asset catalog image resource.
    static let _9H = DeveloperToolsSupport.ImageResource(name: "9h", bundle: resourceBundle)

    /// The "9s" asset catalog image resource.
    static let _9S = DeveloperToolsSupport.ImageResource(name: "9s", bundle: resourceBundle)

    /// The "ACE OF CLUBS" asset catalog image resource.
    static let ACE_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "ACE OF CLUBS", bundle: resourceBundle)

    /// The "ACE OF DIAMONDS" asset catalog image resource.
    static let ACE_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "ACE OF DIAMONDS", bundle: resourceBundle)

    /// The "ACE OF HEARTS" asset catalog image resource.
    static let ACE_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "ACE OF HEARTS", bundle: resourceBundle)

    /// The "ACE OF SPADES" asset catalog image resource.
    static let ACE_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "ACE OF SPADES", bundle: resourceBundle)

    /// The "EIGHT OF CLUBS" asset catalog image resource.
    static let EIGHT_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "EIGHT OF CLUBS", bundle: resourceBundle)

    /// The "EIGHT OF DIAMONDS" asset catalog image resource.
    static let EIGHT_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "EIGHT OF DIAMONDS", bundle: resourceBundle)

    /// The "EIGHT OF HEARTS" asset catalog image resource.
    static let EIGHT_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "EIGHT OF HEARTS", bundle: resourceBundle)

    /// The "EIGHT OF SPADES" asset catalog image resource.
    static let EIGHT_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "EIGHT OF SPADES", bundle: resourceBundle)

    /// The "FIVE OF CLUBS" asset catalog image resource.
    static let FIVE_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "FIVE OF CLUBS", bundle: resourceBundle)

    /// The "FIVE OF DIAMONDS" asset catalog image resource.
    static let FIVE_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "FIVE OF DIAMONDS", bundle: resourceBundle)

    /// The "FIVE OF HEARTS" asset catalog image resource.
    static let FIVE_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "FIVE OF HEARTS", bundle: resourceBundle)

    /// The "FIVE OF SPADES" asset catalog image resource.
    static let FIVE_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "FIVE OF SPADES", bundle: resourceBundle)

    /// The "FOUR OF CLUBS" asset catalog image resource.
    static let FOUR_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "FOUR OF CLUBS", bundle: resourceBundle)

    /// The "FOUR OF DIAMONDS" asset catalog image resource.
    static let FOUR_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "FOUR OF DIAMONDS", bundle: resourceBundle)

    /// The "FOUR OF HEARTS" asset catalog image resource.
    static let FOUR_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "FOUR OF HEARTS", bundle: resourceBundle)

    /// The "FOUR OF SPADES" asset catalog image resource.
    static let FOUR_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "FOUR OF SPADES", bundle: resourceBundle)

    /// The "JACK OF CLUBS" asset catalog image resource.
    static let JACK_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "JACK OF CLUBS", bundle: resourceBundle)

    /// The "JACK OF DIAMONDS" asset catalog image resource.
    static let JACK_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "JACK OF DIAMONDS", bundle: resourceBundle)

    /// The "JACK OF HEARTS" asset catalog image resource.
    static let JACK_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "JACK OF HEARTS", bundle: resourceBundle)

    /// The "JACK OF SPADES" asset catalog image resource.
    static let JACK_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "JACK OF SPADES", bundle: resourceBundle)

    /// The "KING OF CLUBS" asset catalog image resource.
    static let KING_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "KING OF CLUBS", bundle: resourceBundle)

    /// The "KING OF DIAMONDS" asset catalog image resource.
    static let KING_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "KING OF DIAMONDS", bundle: resourceBundle)

    /// The "KING OF HEARTS" asset catalog image resource.
    static let KING_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "KING OF HEARTS", bundle: resourceBundle)

    /// The "KING OF SPADES" asset catalog image resource.
    static let KING_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "KING OF SPADES", bundle: resourceBundle)

    /// The "NINE OF CLUBS" asset catalog image resource.
    static let NINE_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "NINE OF CLUBS", bundle: resourceBundle)

    /// The "NINE OF DIAMONDS" asset catalog image resource.
    static let NINE_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "NINE OF DIAMONDS", bundle: resourceBundle)

    /// The "NINE OF HEARTS" asset catalog image resource.
    static let NINE_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "NINE OF HEARTS", bundle: resourceBundle)

    /// The "NINE OF SPADES" asset catalog image resource.
    static let NINE_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "NINE OF SPADES", bundle: resourceBundle)

    /// The "QUEEN OF CLUBS" asset catalog image resource.
    static let QUEEN_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "QUEEN OF CLUBS", bundle: resourceBundle)

    /// The "QUEEN OF DIAMONDS" asset catalog image resource.
    static let QUEEN_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "QUEEN OF DIAMONDS", bundle: resourceBundle)

    /// The "QUEEN OF HEARTS" asset catalog image resource.
    static let QUEEN_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "QUEEN OF HEARTS", bundle: resourceBundle)

    /// The "QUEEN OF SPADES" asset catalog image resource.
    static let QUEEN_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "QUEEN OF SPADES", bundle: resourceBundle)

    /// The "SEVEN OF CLUBS" asset catalog image resource.
    static let SEVEN_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "SEVEN OF CLUBS", bundle: resourceBundle)

    /// The "SEVEN OF DIAMONDS" asset catalog image resource.
    static let SEVEN_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "SEVEN OF DIAMONDS", bundle: resourceBundle)

    /// The "SEVEN OF HEARTS" asset catalog image resource.
    static let SEVEN_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "SEVEN OF HEARTS", bundle: resourceBundle)

    /// The "SEVEN OF SPADES" asset catalog image resource.
    static let SEVEN_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "SEVEN OF SPADES", bundle: resourceBundle)

    /// The "SIX OF CLUBS" asset catalog image resource.
    static let SIX_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "SIX OF CLUBS", bundle: resourceBundle)

    /// The "SIX OF DIAMONDS" asset catalog image resource.
    static let SIX_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "SIX OF DIAMONDS", bundle: resourceBundle)

    /// The "SIX OF HEARTS" asset catalog image resource.
    static let SIX_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "SIX OF HEARTS", bundle: resourceBundle)

    /// The "SIX OF SPADES" asset catalog image resource.
    static let SIX_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "SIX OF SPADES", bundle: resourceBundle)

    /// The "TEN OF CLUBS" asset catalog image resource.
    static let TEN_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "TEN OF CLUBS", bundle: resourceBundle)

    /// The "TEN OF DIAMONDS" asset catalog image resource.
    static let TEN_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "TEN OF DIAMONDS", bundle: resourceBundle)

    /// The "TEN OF HEARTS" asset catalog image resource.
    static let TEN_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "TEN OF HEARTS", bundle: resourceBundle)

    /// The "TEN OF SPADES" asset catalog image resource.
    static let TEN_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "TEN OF SPADES", bundle: resourceBundle)

    /// The "THE JOKER" asset catalog image resource.
    static let THE_JOKER = DeveloperToolsSupport.ImageResource(name: "THE JOKER", bundle: resourceBundle)

    /// The "THREE OF CLUBS" asset catalog image resource.
    static let THREE_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "THREE OF CLUBS", bundle: resourceBundle)

    /// The "THREE OF DIAMONDS" asset catalog image resource.
    static let THREE_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "THREE OF DIAMONDS", bundle: resourceBundle)

    /// The "THREE OF HEARTS" asset catalog image resource.
    static let THREE_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "THREE OF HEARTS", bundle: resourceBundle)

    /// The "THREE OF SPADES" asset catalog image resource.
    static let THREE_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "THREE OF SPADES", bundle: resourceBundle)

    /// The "TWO OF CLUBS" asset catalog image resource.
    static let TWO_OF_CLUBS = DeveloperToolsSupport.ImageResource(name: "TWO OF CLUBS", bundle: resourceBundle)

    /// The "TWO OF DIAMONDS" asset catalog image resource.
    static let TWO_OF_DIAMONDS = DeveloperToolsSupport.ImageResource(name: "TWO OF DIAMONDS", bundle: resourceBundle)

    /// The "TWO OF HEARTS" asset catalog image resource.
    static let TWO_OF_HEARTS = DeveloperToolsSupport.ImageResource(name: "TWO OF HEARTS", bundle: resourceBundle)

    /// The "TWO OF SPADES" asset catalog image resource.
    static let TWO_OF_SPADES = DeveloperToolsSupport.ImageResource(name: "TWO OF SPADES", bundle: resourceBundle)

    /// The "ac" asset catalog image resource.
    static let ac = DeveloperToolsSupport.ImageResource(name: "ac", bundle: resourceBundle)

    /// The "ad" asset catalog image resource.
    static let ad = DeveloperToolsSupport.ImageResource(name: "ad", bundle: resourceBundle)

    /// The "ah" asset catalog image resource.
    static let ah = DeveloperToolsSupport.ImageResource(name: "ah", bundle: resourceBundle)

    /// The "apptitle" asset catalog image resource.
    static let apptitle = DeveloperToolsSupport.ImageResource(name: "apptitle", bundle: resourceBundle)

    /// The "as" asset catalog image resource.
    static let `as` = DeveloperToolsSupport.ImageResource(name: "as", bundle: resourceBundle)

    /// The "cardback" asset catalog image resource.
    static let cardback = DeveloperToolsSupport.ImageResource(name: "cardback", bundle: resourceBundle)

    /// The "earth" asset catalog image resource.
    static let earth = DeveloperToolsSupport.ImageResource(name: "earth", bundle: resourceBundle)

    /// The "jc" asset catalog image resource.
    static let jc = DeveloperToolsSupport.ImageResource(name: "jc", bundle: resourceBundle)

    /// The "jd" asset catalog image resource.
    static let jd = DeveloperToolsSupport.ImageResource(name: "jd", bundle: resourceBundle)

    /// The "jh" asset catalog image resource.
    static let jh = DeveloperToolsSupport.ImageResource(name: "jh", bundle: resourceBundle)

    /// The "joker" asset catalog image resource.
    static let joker = DeveloperToolsSupport.ImageResource(name: "joker", bundle: resourceBundle)

    /// The "js" asset catalog image resource.
    static let js = DeveloperToolsSupport.ImageResource(name: "js", bundle: resourceBundle)

    /// The "jupiter" asset catalog image resource.
    static let jupiter = DeveloperToolsSupport.ImageResource(name: "jupiter", bundle: resourceBundle)

    /// The "kc" asset catalog image resource.
    static let kc = DeveloperToolsSupport.ImageResource(name: "kc", bundle: resourceBundle)

    /// The "kd" asset catalog image resource.
    static let kd = DeveloperToolsSupport.ImageResource(name: "kd", bundle: resourceBundle)

    /// The "kh" asset catalog image resource.
    static let kh = DeveloperToolsSupport.ImageResource(name: "kh", bundle: resourceBundle)

    /// The "ks" asset catalog image resource.
    static let ks = DeveloperToolsSupport.ImageResource(name: "ks", bundle: resourceBundle)

    /// The "linedesign" asset catalog image resource.
    static let linedesign = DeveloperToolsSupport.ImageResource(name: "linedesign", bundle: resourceBundle)

    /// The "linedesignd" asset catalog image resource.
    static let linedesignd = DeveloperToolsSupport.ImageResource(name: "linedesignd", bundle: resourceBundle)

    /// The "mars" asset catalog image resource.
    static let mars = DeveloperToolsSupport.ImageResource(name: "mars", bundle: resourceBundle)

    /// The "mercury" asset catalog image resource.
    static let mercury = DeveloperToolsSupport.ImageResource(name: "mercury", bundle: resourceBundle)

    /// The "moon" asset catalog image resource.
    static let moon = DeveloperToolsSupport.ImageResource(name: "moon", bundle: resourceBundle)

    /// The "neptune" asset catalog image resource.
    static let neptune = DeveloperToolsSupport.ImageResource(name: "neptune", bundle: resourceBundle)

    /// The "pleiades" asset catalog image resource.
    static let pleiades = DeveloperToolsSupport.ImageResource(name: "pleiades", bundle: resourceBundle)

    /// The "pluto" asset catalog image resource.
    static let pluto = DeveloperToolsSupport.ImageResource(name: "pluto", bundle: resourceBundle)

    /// The "qc" asset catalog image resource.
    static let qc = DeveloperToolsSupport.ImageResource(name: "qc", bundle: resourceBundle)

    /// The "qd" asset catalog image resource.
    static let qd = DeveloperToolsSupport.ImageResource(name: "qd", bundle: resourceBundle)

    /// The "qh" asset catalog image resource.
    static let qh = DeveloperToolsSupport.ImageResource(name: "qh", bundle: resourceBundle)

    /// The "qs" asset catalog image resource.
    static let qs = DeveloperToolsSupport.ImageResource(name: "qs", bundle: resourceBundle)

    /// The "saturn" asset catalog image resource.
    static let saturn = DeveloperToolsSupport.ImageResource(name: "saturn", bundle: resourceBundle)

    /// The "sun" asset catalog image resource.
    static let sun = DeveloperToolsSupport.ImageResource(name: "sun", bundle: resourceBundle)

    /// The "uranus" asset catalog image resource.
    static let uranus = DeveloperToolsSupport.ImageResource(name: "uranus", bundle: resourceBundle)

    /// The "venus" asset catalog image resource.
    static let venus = DeveloperToolsSupport.ImageResource(name: "venus", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "LaunchScreenBackground" asset catalog color.
    static var launchScreenBackground: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .launchScreenBackground)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "LaunchScreenBackground" asset catalog color.
    static var launchScreenBackground: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .launchScreenBackground)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "LaunchScreenBackground" asset catalog color.
    static var launchScreenBackground: SwiftUI.Color { .init(.launchScreenBackground) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "LaunchScreenBackground" asset catalog color.
    static var launchScreenBackground: SwiftUI.Color { .init(.launchScreenBackground) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "10c" asset catalog image.
    static var _10C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._10C)
#else
        .init()
#endif
    }

    /// The "10d" asset catalog image.
    static var _10D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._10D)
#else
        .init()
#endif
    }

    /// The "10h" asset catalog image.
    static var _10H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._10H)
#else
        .init()
#endif
    }

    /// The "10s" asset catalog image.
    static var _10S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._10S)
#else
        .init()
#endif
    }

    /// The "2c" asset catalog image.
    static var _2C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._2C)
#else
        .init()
#endif
    }

    /// The "2d" asset catalog image.
    static var _2D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._2D)
#else
        .init()
#endif
    }

    /// The "2h" asset catalog image.
    static var _2H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._2H)
#else
        .init()
#endif
    }

    /// The "2s" asset catalog image.
    static var _2S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._2S)
#else
        .init()
#endif
    }

    /// The "3c" asset catalog image.
    static var _3C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._3C)
#else
        .init()
#endif
    }

    /// The "3d" asset catalog image.
    static var _3D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._3D)
#else
        .init()
#endif
    }

    /// The "3h" asset catalog image.
    static var _3H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._3H)
#else
        .init()
#endif
    }

    /// The "3s" asset catalog image.
    static var _3S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._3S)
#else
        .init()
#endif
    }

    /// The "4c" asset catalog image.
    static var _4C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._4C)
#else
        .init()
#endif
    }

    /// The "4d" asset catalog image.
    static var _4D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._4D)
#else
        .init()
#endif
    }

    /// The "4h" asset catalog image.
    static var _4H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._4H)
#else
        .init()
#endif
    }

    /// The "4s" asset catalog image.
    static var _4S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._4S)
#else
        .init()
#endif
    }

    /// The "5c" asset catalog image.
    static var _5C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._5C)
#else
        .init()
#endif
    }

    /// The "5d" asset catalog image.
    static var _5D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._5D)
#else
        .init()
#endif
    }

    /// The "5h" asset catalog image.
    static var _5H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._5H)
#else
        .init()
#endif
    }

    /// The "5s" asset catalog image.
    static var _5S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._5S)
#else
        .init()
#endif
    }

    /// The "6c" asset catalog image.
    static var _6C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._6C)
#else
        .init()
#endif
    }

    /// The "6d" asset catalog image.
    static var _6D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._6D)
#else
        .init()
#endif
    }

    /// The "6h" asset catalog image.
    static var _6H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._6H)
#else
        .init()
#endif
    }

    /// The "6s" asset catalog image.
    static var _6S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._6S)
#else
        .init()
#endif
    }

    /// The "7c" asset catalog image.
    static var _7C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._7C)
#else
        .init()
#endif
    }

    /// The "7d" asset catalog image.
    static var _7D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._7D)
#else
        .init()
#endif
    }

    /// The "7h" asset catalog image.
    static var _7H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._7H)
#else
        .init()
#endif
    }

    /// The "7s" asset catalog image.
    static var _7S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._7S)
#else
        .init()
#endif
    }

    /// The "8c" asset catalog image.
    static var _8C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._8C)
#else
        .init()
#endif
    }

    /// The "8d" asset catalog image.
    static var _8D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._8D)
#else
        .init()
#endif
    }

    /// The "8h" asset catalog image.
    static var _8H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._8H)
#else
        .init()
#endif
    }

    /// The "8s" asset catalog image.
    static var _8S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._8S)
#else
        .init()
#endif
    }

    /// The "9c" asset catalog image.
    static var _9C: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._9C)
#else
        .init()
#endif
    }

    /// The "9d" asset catalog image.
    static var _9D: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._9D)
#else
        .init()
#endif
    }

    /// The "9h" asset catalog image.
    static var _9H: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._9H)
#else
        .init()
#endif
    }

    /// The "9s" asset catalog image.
    static var _9S: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._9S)
#else
        .init()
#endif
    }

    /// The "ACE OF CLUBS" asset catalog image.
    static var ACE_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ACE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "ACE OF DIAMONDS" asset catalog image.
    static var ACE_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ACE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "ACE OF HEARTS" asset catalog image.
    static var ACE_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ACE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "ACE OF SPADES" asset catalog image.
    static var ACE_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ACE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "EIGHT OF CLUBS" asset catalog image.
    static var EIGHT_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .EIGHT_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "EIGHT OF DIAMONDS" asset catalog image.
    static var EIGHT_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .EIGHT_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "EIGHT OF HEARTS" asset catalog image.
    static var EIGHT_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .EIGHT_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "EIGHT OF SPADES" asset catalog image.
    static var EIGHT_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .EIGHT_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "FIVE OF CLUBS" asset catalog image.
    static var FIVE_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FIVE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "FIVE OF DIAMONDS" asset catalog image.
    static var FIVE_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FIVE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "FIVE OF HEARTS" asset catalog image.
    static var FIVE_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FIVE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "FIVE OF SPADES" asset catalog image.
    static var FIVE_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FIVE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "FOUR OF CLUBS" asset catalog image.
    static var FOUR_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FOUR_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "FOUR OF DIAMONDS" asset catalog image.
    static var FOUR_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FOUR_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "FOUR OF HEARTS" asset catalog image.
    static var FOUR_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FOUR_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "FOUR OF SPADES" asset catalog image.
    static var FOUR_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .FOUR_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "JACK OF CLUBS" asset catalog image.
    static var JACK_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .JACK_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "JACK OF DIAMONDS" asset catalog image.
    static var JACK_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .JACK_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "JACK OF HEARTS" asset catalog image.
    static var JACK_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .JACK_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "JACK OF SPADES" asset catalog image.
    static var JACK_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .JACK_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "KING OF CLUBS" asset catalog image.
    static var KING_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .KING_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "KING OF DIAMONDS" asset catalog image.
    static var KING_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .KING_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "KING OF HEARTS" asset catalog image.
    static var KING_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .KING_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "KING OF SPADES" asset catalog image.
    static var KING_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .KING_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "NINE OF CLUBS" asset catalog image.
    static var NINE_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .NINE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "NINE OF DIAMONDS" asset catalog image.
    static var NINE_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .NINE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "NINE OF HEARTS" asset catalog image.
    static var NINE_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .NINE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "NINE OF SPADES" asset catalog image.
    static var NINE_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .NINE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "QUEEN OF CLUBS" asset catalog image.
    static var QUEEN_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .QUEEN_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "QUEEN OF DIAMONDS" asset catalog image.
    static var QUEEN_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .QUEEN_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "QUEEN OF HEARTS" asset catalog image.
    static var QUEEN_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .QUEEN_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "QUEEN OF SPADES" asset catalog image.
    static var QUEEN_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .QUEEN_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "SEVEN OF CLUBS" asset catalog image.
    static var SEVEN_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SEVEN_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "SEVEN OF DIAMONDS" asset catalog image.
    static var SEVEN_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SEVEN_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "SEVEN OF HEARTS" asset catalog image.
    static var SEVEN_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SEVEN_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "SEVEN OF SPADES" asset catalog image.
    static var SEVEN_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SEVEN_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "SIX OF CLUBS" asset catalog image.
    static var SIX_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SIX_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "SIX OF DIAMONDS" asset catalog image.
    static var SIX_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SIX_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "SIX OF HEARTS" asset catalog image.
    static var SIX_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SIX_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "SIX OF SPADES" asset catalog image.
    static var SIX_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .SIX_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "TEN OF CLUBS" asset catalog image.
    static var TEN_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TEN_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "TEN OF DIAMONDS" asset catalog image.
    static var TEN_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TEN_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "TEN OF HEARTS" asset catalog image.
    static var TEN_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TEN_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "TEN OF SPADES" asset catalog image.
    static var TEN_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TEN_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "THE JOKER" asset catalog image.
    static var THE_JOKER: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .THE_JOKER)
#else
        .init()
#endif
    }

    /// The "THREE OF CLUBS" asset catalog image.
    static var THREE_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .THREE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "THREE OF DIAMONDS" asset catalog image.
    static var THREE_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .THREE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "THREE OF HEARTS" asset catalog image.
    static var THREE_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .THREE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "THREE OF SPADES" asset catalog image.
    static var THREE_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .THREE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "TWO OF CLUBS" asset catalog image.
    static var TWO_OF_CLUBS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TWO_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "TWO OF DIAMONDS" asset catalog image.
    static var TWO_OF_DIAMONDS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TWO_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "TWO OF HEARTS" asset catalog image.
    static var TWO_OF_HEARTS: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TWO_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "TWO OF SPADES" asset catalog image.
    static var TWO_OF_SPADES: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .TWO_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "ac" asset catalog image.
    static var ac: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ac)
#else
        .init()
#endif
    }

    /// The "ad" asset catalog image.
    static var ad: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ad)
#else
        .init()
#endif
    }

    /// The "ah" asset catalog image.
    static var ah: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ah)
#else
        .init()
#endif
    }

    /// The "apptitle" asset catalog image.
    static var apptitle: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .apptitle)
#else
        .init()
#endif
    }

    /// The "as" asset catalog image.
    static var `as`: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .`as`)
#else
        .init()
#endif
    }

    /// The "cardback" asset catalog image.
    static var cardback: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cardback)
#else
        .init()
#endif
    }

    /// The "earth" asset catalog image.
    static var earth: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .earth)
#else
        .init()
#endif
    }

    /// The "jc" asset catalog image.
    static var jc: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .jc)
#else
        .init()
#endif
    }

    /// The "jd" asset catalog image.
    static var jd: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .jd)
#else
        .init()
#endif
    }

    /// The "jh" asset catalog image.
    static var jh: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .jh)
#else
        .init()
#endif
    }

    /// The "joker" asset catalog image.
    static var joker: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .joker)
#else
        .init()
#endif
    }

    /// The "js" asset catalog image.
    static var js: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .js)
#else
        .init()
#endif
    }

    /// The "jupiter" asset catalog image.
    static var jupiter: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .jupiter)
#else
        .init()
#endif
    }

    /// The "kc" asset catalog image.
    static var kc: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .kc)
#else
        .init()
#endif
    }

    /// The "kd" asset catalog image.
    static var kd: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .kd)
#else
        .init()
#endif
    }

    /// The "kh" asset catalog image.
    static var kh: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .kh)
#else
        .init()
#endif
    }

    /// The "ks" asset catalog image.
    static var ks: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .ks)
#else
        .init()
#endif
    }

    /// The "linedesign" asset catalog image.
    static var linedesign: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .linedesign)
#else
        .init()
#endif
    }

    /// The "linedesignd" asset catalog image.
    static var linedesignd: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .linedesignd)
#else
        .init()
#endif
    }

    /// The "mars" asset catalog image.
    static var mars: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .mars)
#else
        .init()
#endif
    }

    /// The "mercury" asset catalog image.
    static var mercury: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .mercury)
#else
        .init()
#endif
    }

    /// The "moon" asset catalog image.
    static var moon: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .moon)
#else
        .init()
#endif
    }

    /// The "neptune" asset catalog image.
    static var neptune: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .neptune)
#else
        .init()
#endif
    }

    /// The "pleiades" asset catalog image.
    static var pleiades: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pleiades)
#else
        .init()
#endif
    }

    /// The "pluto" asset catalog image.
    static var pluto: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pluto)
#else
        .init()
#endif
    }

    /// The "qc" asset catalog image.
    static var qc: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .qc)
#else
        .init()
#endif
    }

    /// The "qd" asset catalog image.
    static var qd: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .qd)
#else
        .init()
#endif
    }

    /// The "qh" asset catalog image.
    static var qh: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .qh)
#else
        .init()
#endif
    }

    /// The "qs" asset catalog image.
    static var qs: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .qs)
#else
        .init()
#endif
    }

    /// The "saturn" asset catalog image.
    static var saturn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .saturn)
#else
        .init()
#endif
    }

    /// The "sun" asset catalog image.
    static var sun: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .sun)
#else
        .init()
#endif
    }

    /// The "uranus" asset catalog image.
    static var uranus: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .uranus)
#else
        .init()
#endif
    }

    /// The "venus" asset catalog image.
    static var venus: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .venus)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "10c" asset catalog image.
    static var _10C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._10C)
#else
        .init()
#endif
    }

    /// The "10d" asset catalog image.
    static var _10D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._10D)
#else
        .init()
#endif
    }

    /// The "10h" asset catalog image.
    static var _10H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._10H)
#else
        .init()
#endif
    }

    /// The "10s" asset catalog image.
    static var _10S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._10S)
#else
        .init()
#endif
    }

    /// The "2c" asset catalog image.
    static var _2C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._2C)
#else
        .init()
#endif
    }

    /// The "2d" asset catalog image.
    static var _2D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._2D)
#else
        .init()
#endif
    }

    /// The "2h" asset catalog image.
    static var _2H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._2H)
#else
        .init()
#endif
    }

    /// The "2s" asset catalog image.
    static var _2S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._2S)
#else
        .init()
#endif
    }

    /// The "3c" asset catalog image.
    static var _3C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._3C)
#else
        .init()
#endif
    }

    /// The "3d" asset catalog image.
    static var _3D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._3D)
#else
        .init()
#endif
    }

    /// The "3h" asset catalog image.
    static var _3H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._3H)
#else
        .init()
#endif
    }

    /// The "3s" asset catalog image.
    static var _3S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._3S)
#else
        .init()
#endif
    }

    /// The "4c" asset catalog image.
    static var _4C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._4C)
#else
        .init()
#endif
    }

    /// The "4d" asset catalog image.
    static var _4D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._4D)
#else
        .init()
#endif
    }

    /// The "4h" asset catalog image.
    static var _4H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._4H)
#else
        .init()
#endif
    }

    /// The "4s" asset catalog image.
    static var _4S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._4S)
#else
        .init()
#endif
    }

    /// The "5c" asset catalog image.
    static var _5C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._5C)
#else
        .init()
#endif
    }

    /// The "5d" asset catalog image.
    static var _5D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._5D)
#else
        .init()
#endif
    }

    /// The "5h" asset catalog image.
    static var _5H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._5H)
#else
        .init()
#endif
    }

    /// The "5s" asset catalog image.
    static var _5S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._5S)
#else
        .init()
#endif
    }

    /// The "6c" asset catalog image.
    static var _6C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._6C)
#else
        .init()
#endif
    }

    /// The "6d" asset catalog image.
    static var _6D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._6D)
#else
        .init()
#endif
    }

    /// The "6h" asset catalog image.
    static var _6H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._6H)
#else
        .init()
#endif
    }

    /// The "6s" asset catalog image.
    static var _6S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._6S)
#else
        .init()
#endif
    }

    /// The "7c" asset catalog image.
    static var _7C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._7C)
#else
        .init()
#endif
    }

    /// The "7d" asset catalog image.
    static var _7D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._7D)
#else
        .init()
#endif
    }

    /// The "7h" asset catalog image.
    static var _7H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._7H)
#else
        .init()
#endif
    }

    /// The "7s" asset catalog image.
    static var _7S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._7S)
#else
        .init()
#endif
    }

    /// The "8c" asset catalog image.
    static var _8C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._8C)
#else
        .init()
#endif
    }

    /// The "8d" asset catalog image.
    static var _8D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._8D)
#else
        .init()
#endif
    }

    /// The "8h" asset catalog image.
    static var _8H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._8H)
#else
        .init()
#endif
    }

    /// The "8s" asset catalog image.
    static var _8S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._8S)
#else
        .init()
#endif
    }

    /// The "9c" asset catalog image.
    static var _9C: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._9C)
#else
        .init()
#endif
    }

    /// The "9d" asset catalog image.
    static var _9D: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._9D)
#else
        .init()
#endif
    }

    /// The "9h" asset catalog image.
    static var _9H: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._9H)
#else
        .init()
#endif
    }

    /// The "9s" asset catalog image.
    static var _9S: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._9S)
#else
        .init()
#endif
    }

    /// The "ACE OF CLUBS" asset catalog image.
    static var ACE_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ACE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "ACE OF DIAMONDS" asset catalog image.
    static var ACE_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ACE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "ACE OF HEARTS" asset catalog image.
    static var ACE_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ACE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "ACE OF SPADES" asset catalog image.
    static var ACE_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ACE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "EIGHT OF CLUBS" asset catalog image.
    static var EIGHT_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .EIGHT_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "EIGHT OF DIAMONDS" asset catalog image.
    static var EIGHT_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .EIGHT_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "EIGHT OF HEARTS" asset catalog image.
    static var EIGHT_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .EIGHT_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "EIGHT OF SPADES" asset catalog image.
    static var EIGHT_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .EIGHT_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "FIVE OF CLUBS" asset catalog image.
    static var FIVE_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FIVE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "FIVE OF DIAMONDS" asset catalog image.
    static var FIVE_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FIVE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "FIVE OF HEARTS" asset catalog image.
    static var FIVE_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FIVE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "FIVE OF SPADES" asset catalog image.
    static var FIVE_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FIVE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "FOUR OF CLUBS" asset catalog image.
    static var FOUR_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FOUR_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "FOUR OF DIAMONDS" asset catalog image.
    static var FOUR_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FOUR_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "FOUR OF HEARTS" asset catalog image.
    static var FOUR_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FOUR_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "FOUR OF SPADES" asset catalog image.
    static var FOUR_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .FOUR_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "JACK OF CLUBS" asset catalog image.
    static var JACK_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .JACK_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "JACK OF DIAMONDS" asset catalog image.
    static var JACK_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .JACK_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "JACK OF HEARTS" asset catalog image.
    static var JACK_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .JACK_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "JACK OF SPADES" asset catalog image.
    static var JACK_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .JACK_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "KING OF CLUBS" asset catalog image.
    static var KING_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .KING_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "KING OF DIAMONDS" asset catalog image.
    static var KING_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .KING_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "KING OF HEARTS" asset catalog image.
    static var KING_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .KING_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "KING OF SPADES" asset catalog image.
    static var KING_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .KING_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "NINE OF CLUBS" asset catalog image.
    static var NINE_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .NINE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "NINE OF DIAMONDS" asset catalog image.
    static var NINE_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .NINE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "NINE OF HEARTS" asset catalog image.
    static var NINE_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .NINE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "NINE OF SPADES" asset catalog image.
    static var NINE_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .NINE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "QUEEN OF CLUBS" asset catalog image.
    static var QUEEN_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .QUEEN_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "QUEEN OF DIAMONDS" asset catalog image.
    static var QUEEN_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .QUEEN_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "QUEEN OF HEARTS" asset catalog image.
    static var QUEEN_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .QUEEN_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "QUEEN OF SPADES" asset catalog image.
    static var QUEEN_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .QUEEN_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "SEVEN OF CLUBS" asset catalog image.
    static var SEVEN_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SEVEN_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "SEVEN OF DIAMONDS" asset catalog image.
    static var SEVEN_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SEVEN_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "SEVEN OF HEARTS" asset catalog image.
    static var SEVEN_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SEVEN_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "SEVEN OF SPADES" asset catalog image.
    static var SEVEN_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SEVEN_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "SIX OF CLUBS" asset catalog image.
    static var SIX_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SIX_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "SIX OF DIAMONDS" asset catalog image.
    static var SIX_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SIX_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "SIX OF HEARTS" asset catalog image.
    static var SIX_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SIX_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "SIX OF SPADES" asset catalog image.
    static var SIX_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .SIX_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "TEN OF CLUBS" asset catalog image.
    static var TEN_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TEN_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "TEN OF DIAMONDS" asset catalog image.
    static var TEN_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TEN_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "TEN OF HEARTS" asset catalog image.
    static var TEN_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TEN_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "TEN OF SPADES" asset catalog image.
    static var TEN_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TEN_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "THE JOKER" asset catalog image.
    static var THE_JOKER: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .THE_JOKER)
#else
        .init()
#endif
    }

    /// The "THREE OF CLUBS" asset catalog image.
    static var THREE_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .THREE_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "THREE OF DIAMONDS" asset catalog image.
    static var THREE_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .THREE_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "THREE OF HEARTS" asset catalog image.
    static var THREE_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .THREE_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "THREE OF SPADES" asset catalog image.
    static var THREE_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .THREE_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "TWO OF CLUBS" asset catalog image.
    static var TWO_OF_CLUBS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TWO_OF_CLUBS)
#else
        .init()
#endif
    }

    /// The "TWO OF DIAMONDS" asset catalog image.
    static var TWO_OF_DIAMONDS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TWO_OF_DIAMONDS)
#else
        .init()
#endif
    }

    /// The "TWO OF HEARTS" asset catalog image.
    static var TWO_OF_HEARTS: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TWO_OF_HEARTS)
#else
        .init()
#endif
    }

    /// The "TWO OF SPADES" asset catalog image.
    static var TWO_OF_SPADES: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .TWO_OF_SPADES)
#else
        .init()
#endif
    }

    /// The "ac" asset catalog image.
    static var ac: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ac)
#else
        .init()
#endif
    }

    /// The "ad" asset catalog image.
    static var ad: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ad)
#else
        .init()
#endif
    }

    /// The "ah" asset catalog image.
    static var ah: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ah)
#else
        .init()
#endif
    }

    /// The "apptitle" asset catalog image.
    static var apptitle: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .apptitle)
#else
        .init()
#endif
    }

    /// The "as" asset catalog image.
    static var `as`: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .`as`)
#else
        .init()
#endif
    }

    /// The "cardback" asset catalog image.
    static var cardback: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cardback)
#else
        .init()
#endif
    }

    /// The "earth" asset catalog image.
    static var earth: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .earth)
#else
        .init()
#endif
    }

    /// The "jc" asset catalog image.
    static var jc: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .jc)
#else
        .init()
#endif
    }

    /// The "jd" asset catalog image.
    static var jd: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .jd)
#else
        .init()
#endif
    }

    /// The "jh" asset catalog image.
    static var jh: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .jh)
#else
        .init()
#endif
    }

    /// The "joker" asset catalog image.
    static var joker: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .joker)
#else
        .init()
#endif
    }

    /// The "js" asset catalog image.
    static var js: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .js)
#else
        .init()
#endif
    }

    /// The "jupiter" asset catalog image.
    static var jupiter: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .jupiter)
#else
        .init()
#endif
    }

    /// The "kc" asset catalog image.
    static var kc: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .kc)
#else
        .init()
#endif
    }

    /// The "kd" asset catalog image.
    static var kd: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .kd)
#else
        .init()
#endif
    }

    /// The "kh" asset catalog image.
    static var kh: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .kh)
#else
        .init()
#endif
    }

    /// The "ks" asset catalog image.
    static var ks: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .ks)
#else
        .init()
#endif
    }

    /// The "linedesign" asset catalog image.
    static var linedesign: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .linedesign)
#else
        .init()
#endif
    }

    /// The "linedesignd" asset catalog image.
    static var linedesignd: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .linedesignd)
#else
        .init()
#endif
    }

    /// The "mars" asset catalog image.
    static var mars: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .mars)
#else
        .init()
#endif
    }

    /// The "mercury" asset catalog image.
    static var mercury: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .mercury)
#else
        .init()
#endif
    }

    /// The "moon" asset catalog image.
    static var moon: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .moon)
#else
        .init()
#endif
    }

    /// The "neptune" asset catalog image.
    static var neptune: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .neptune)
#else
        .init()
#endif
    }

    /// The "pleiades" asset catalog image.
    static var pleiades: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pleiades)
#else
        .init()
#endif
    }

    /// The "pluto" asset catalog image.
    static var pluto: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pluto)
#else
        .init()
#endif
    }

    /// The "qc" asset catalog image.
    static var qc: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .qc)
#else
        .init()
#endif
    }

    /// The "qd" asset catalog image.
    static var qd: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .qd)
#else
        .init()
#endif
    }

    /// The "qh" asset catalog image.
    static var qh: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .qh)
#else
        .init()
#endif
    }

    /// The "qs" asset catalog image.
    static var qs: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .qs)
#else
        .init()
#endif
    }

    /// The "saturn" asset catalog image.
    static var saturn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .saturn)
#else
        .init()
#endif
    }

    /// The "sun" asset catalog image.
    static var sun: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .sun)
#else
        .init()
#endif
    }

    /// The "uranus" asset catalog image.
    static var uranus: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .uranus)
#else
        .init()
#endif
    }

    /// The "venus" asset catalog image.
    static var venus: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .venus)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

