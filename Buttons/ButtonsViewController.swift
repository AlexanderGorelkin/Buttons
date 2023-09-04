//
//  ButtonsViewController.swift
//  Buttons
//
//  Created by Александр Горелкин on 04.09.2023.
//

import UIKit

final class ButtonsViewController: UIViewController {
    
    
    
    private lazy var firstButton = createButton(textLabel: "First Button")
    private lazy var secondButton = createButton(textLabel: "Second Medium Button")
    private lazy var thirdButton = createButton(textLabel: "Third", needShowController: true)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        
        
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        
        thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10).isActive = true
    }
    
    
    func createButton(textLabel: String, needShowController: Bool = false) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.title = textLabel
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        let button = CustomButton(configuration: configuration)
        button.configurationUpdateHandler = handler
        button.translatesAutoresizingMaskIntoConstraints = false
        if needShowController {
            button.addTarget(self, action: #selector(openController), for: .touchUpInside)
        }
        return button
    }
    
    let handler: UIButton.ConfigurationUpdateHandler = { button in // 1
        switch button.tintAdjustmentMode {
        case .normal:
            button.configuration?.background.backgroundColor = .systemBlue
            button.configuration?.baseForegroundColor = .white
        case .dimmed:
            button.configuration?.background.backgroundColor = .systemGray2
            button.configuration?.baseForegroundColor = .systemGray3
        default:
            button.configuration?.background.backgroundColor = .systemBlue
            button.configuration?.baseForegroundColor = .white
        }
    }
    
    
    @objc func openController() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
    
}


