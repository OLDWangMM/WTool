//
//  File.swift
//
//
//  Created by mac on 2024/2/6.
//

import EmptyDataSet_Swift
import UIKit

extension UIScrollView {
    private enum AssociatedKeys {
        static var key: Void?
    }

    var empty: EmptyView? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.key) as? EmptyView
        }
        set {
            emptyDataSetDelegate = newValue
            emptyDataSetSource = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class EmptyView: EmptyDataSetSource, EmptyDataSetDelegate {
    var title: String?
    var titleColor = UIColor.black
    var titleFont = UIFont.systemFont(ofSize: 16)
    var isShowTitle = true
    var image: UIImage?
    var subTitle: String?

    init(title: String? = nil) {
        self.title = title
    }

    func title(forEmptyDataSet _: UIScrollView) -> NSAttributedString? {
        let placeholserAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                     NSAttributedString.Key.font: titleFont]
        if isShowTitle {
            return NSAttributedString(string: title ?? "", attributes: placeholserAttributes)
        } else {
            return NSAttributedString(string: "", attributes: placeholserAttributes)
        }
    }

    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let placeholserAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        return NSAttributedString(string: subTitle ?? "", attributes: placeholserAttributes)
    }

    func image(forEmptyDataSet _: UIScrollView) -> UIImage? {
        image
    }

    func verticalOffset(forEmptyDataSet _: UIScrollView) -> CGFloat {
        0
    }

    func emptyDataSetShouldDisplay(_: UIScrollView) -> Bool {
        true
    }
}
