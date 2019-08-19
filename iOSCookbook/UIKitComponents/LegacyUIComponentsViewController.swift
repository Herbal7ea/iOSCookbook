import UIKit
import SwiftUI

class LegacyUIComponentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSwitch()
    }
}

// MARK: - UISwitch
extension LegacyUIComponentsViewController {
    func addSwitch() {
        let frame = CGRect(x: 150, y: 150, width: 0, height: 0)
        let switchOnOff = UISwitch(frame: frame)
            switchOnOff.setOn(true, animated: false)
//            switchOnOff.tintColor = .blue
//            switchOnOff.onTintColor = .cyan
//            switchOnOff.thumbTintColor = .red
//            switchOnOff.backgroundColor = .yellow
            switchOnOff.addTarget(self, action: #selector(LegacyUIComponentsViewController.switchStateDidChange(_:)), for: .valueChanged)
//            switchOnOff.onImage = UIImage(named: "on-switch")
//            switchOnOff.offImage = UIImage(named: "off-switch")
        
        
        view.addSubview(switchOnOff)
    }
    
    @objc
    func switchStateDidChange(_ sender: UISwitch) {
        let state = sender.isOn ? "On" : "Off"
        print("UISwitch state is \(state)")
    }
}

struct LegacyUIComponentsContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LegacyUIComponentsViewController {
        return LegacyUIComponentsViewController()
    }
    
    func updateUIViewController(_ uiViewController: LegacyUIComponentsViewController, context: Context) {
    
    }
}
