//
//  BasicButton.swift
//  LoginSetup
//
//  Created by Alex Yushchenko on 05/08/2024.
//

import Foundation
import UIKit

typealias Action = () -> Void

struct ButtonViewModel {
    let title: String
    let action: Action?
    let normalColor: UIColor
    let highlightedColor: UIColor
    
    private init(
        title: String,
        action: Action?,
        normalColor: UIColor,
        highlightedColor: UIColor
    ) {
        self.title = title
        self.action = action
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
    }
    
    static func systemButton(title: String, action: Action?) -> ButtonViewModel {
        .init(
            title: title,
            action: action,
            normalColor: .systemBlue,
            highlightedColor: .systemBlue.withAlphaComponent(0.7)
        )
    }
}

class BasicButton: UIButton {
    private var action: Action?
    
    public init() {
        super.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) { fatalError() }
    
    public func configure(_ configuration: ButtonViewModel) {
        setTitle(configuration.title, for: .normal)
        action = configuration.action
        
        setTitleColor(configuration.normalColor, for: .normal)
        setTitleColor(configuration.highlightedColor, for: .highlighted)
        
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc func handleTap() {
        action?()
    }
}
