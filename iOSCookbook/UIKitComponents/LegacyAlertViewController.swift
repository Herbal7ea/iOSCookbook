import UIKit
import SwiftUI

// Based off the walkthrough from iosdevcenters: https://iosdevcenters.blogspot.com/2016/03/uialertcontroller-in-swift.html?m=1

enum AlertType: Int, CaseIterable {
    case simple,
         destructive,
         plainTextStyle,
         secureStyle,
         loginStyle
}

class LegacyAlertViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
    }

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return AlertType.allCases.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alertType = AlertType(rawValue: indexPath.row)!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
            cell.textLabel?.text = "\(alertType)"
        return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertType = AlertType(rawValue: indexPath.row)!
        switch(alertType) {
        
        case .simple:
            presentAlert_Simple()
        case .destructive:
            presentAlert_Destructive()
        case .plainTextStyle:
            presentAlert_PlainTextStyle()
        case .secureStyle:
            presentAlert_SecureStyle()
        case .loginStyle:
            presentAlert_LoginStyle()
        }
    }
}

// MARK: - Alert Types Section
extension LegacyAlertViewController {
    func presentAlert_Simple(){
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in print("🙆‍♂️ Roger Roger") }
        let okAction     = UIAlertAction(title: "OK", style: .default) { _ in print("🦄 neigh-ce [nice]") }

        let alertController = UIAlertController(title: "Simple", message: "Prefer something simple?", preferredStyle: .alert)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }

    func presentAlert_Destructive(){
        let destructiveAction = UIAlertAction(title: "Delete", style: .destructive) { _ in print("💀 Beware") }
        let okAction     = UIAlertAction(title: "OK", style: .default) { _ in print("🦄 neigh-ce [nice]") }

        let alertController = UIAlertController(title: "Destructive", message: "Prefer something destructive?", preferredStyle: .alert)
            alertController.addAction(destructiveAction)
            alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }

    func presentAlert_PlainTextStyle(){
        let alertController = UIAlertController(title: "SecureStyle", message: "Prefer something more Secure?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in print("🙆‍♂️ Roger Roger") }
        let okAction     = UIAlertAction(title: "OK", style: .default) { [unowned alertController] _ in
            let login = alertController.textFields!.first!
            print("login: \(login)")
        }

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        alertController.addTextField { $0.placeholder = "Login" }

        present(alertController, animated: true)
    }

    func presentAlert_SecureStyle(){
        let alertController = UIAlertController(title: "SecureStyle", message: "Prefer something more Secure?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in print("🙆‍♂️ Roger Roger") }
        let okAction     = UIAlertAction(title: "OK", style: .default) { [unowned alertController] _ in
            let login = alertController.textFields!.first!
            print("login: \(login)")
        }

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        alertController.addTextField {
            $0.placeholder = "Password"
            $0.isSecureTextEntry = true
        }

        present(alertController, animated: true)
    }

    func presentAlert_LoginStyle(){
        
        let alertController = UIAlertController(title: "LoginStyle", message: "Prefer something more flare?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in print("🙆‍♂️ Roger Roger") }
        let okAction     = UIAlertAction(title: "OK", style: .default) { [unowned alertController] _ in
            let login = alertController.textFields!.first!
            print("login: \(login)")
        }
        
        okAction.isEnabled = false
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        alertController.addTextField {
            $0.placeholder = "Login"
            $0.addTarget(self, action: #selector(LegacyAlertViewController.alertTextFieldDidChange(sender:)), for: .editingChanged)
            $0.isSecureTextEntry = true
        }
        alertController.addTextField {
            $0.isSecureTextEntry = true
            $0.placeholder = "Password"
        }

        present(alertController, animated: true)
    }

    @objc
    func alertTextFieldDidChange(sender: UITextField) {
        //! for fail fast in development - these should ALWAYS be non-null
        let alertVC = presentedViewController as! UIAlertController
        let login = alertVC.textFields!.first!
        let okAction = alertVC.actions.last!
        
        if let text = login.text, text.count > 2 {
            okAction.isEnabled = true
        }
    }
}


// MARK: - Swift UI compatibility
struct LegacyAlertViewContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LegacyAlertViewController {
        return LegacyAlertViewController()
    }
    
    func updateUIViewController(_ uiViewController: LegacyAlertViewController, context: Context) {
        
    }
}
