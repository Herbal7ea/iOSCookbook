// Based off the walkthrough from iosdevcenters excellent and simple blog: https://iosdevcenters.blogspot.com/2016/03/ios9-uidatepicker-example-with.html?m=1
// Note: Not using Autolayout

import UIKit
import SwiftUI

class LegacyTextDateToolbarViewController: UIViewController {

    var dateTextField: UITextField!
    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField = addTextField()
    }
    
    func createDatePickerUI() {
        datePicker = createDatePicker(for: dateTextField)
        createToolbar(for: dateTextField)
    }
}

// MARK: - TextFields
extension LegacyTextDateToolbarViewController {
    func addTextField() -> UITextField {
        
        let bounds = UIScreen.main.bounds
        let width  = Int(bounds.width) - 32
        let height = 32
        let frame  = CGRect(x: 16, y: 100, width: width, height: height)
        
        let sampleTextField = UITextField(frame: frame)
            sampleTextField.placeholder = "Enter text here"
            sampleTextField.font = .systemFont(ofSize: 15)
            sampleTextField.borderStyle = .roundedRect
            sampleTextField.autocorrectionType = .no
            sampleTextField.keyboardType = .default
            sampleTextField.returnKeyType = .done
            sampleTextField.clearButtonMode = .whileEditing
            sampleTextField.contentVerticalAlignment = .center
            sampleTextField.delegate = self
        
        view.addSubview(sampleTextField)
        
        return sampleTextField
    }
}

// MARK: - UITextFieldDelegate
extension LegacyTextDateToolbarViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        createDatePickerUI()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("🦄: done")
    }
}

// MARK: - DatePicker
extension LegacyTextDateToolbarViewController {
    @discardableResult
    func createDatePicker(for textField: UITextField) -> UIDatePicker {
        let width = Int(view.frame.size.width)
        let height = 216
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let datePicker = UIDatePicker(frame: frame)
            datePicker.backgroundColor = .white
            datePicker.datePickerMode = .date
        
        textField.inputView = datePicker
        
        return datePicker
    }
}

// MARK: - Toolbar
extension LegacyTextDateToolbarViewController {
    func createToolbar(for textfield: UITextField) {
    
        //Create Toolbar Buttons
        let spacer       = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton   = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(LegacyTextDateToolbarViewController.doneTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(LegacyTextDateToolbarViewController.cancelTapped))
        
        //Create Toolbar
        let tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        let toolbar = UIToolbar()
            toolbar.barStyle = .default
            toolbar.isTranslucent = true
            toolbar.tintColor = tintColor
            toolbar.sizeToFit()
            toolbar.setItems([cancelButton, spacer, doneButton], animated: false)
            toolbar.isUserInteractionEnabled = true
        
        textfield.inputAccessoryView = toolbar
    }
    
    // MARK: Events
    @objc
    func doneTapped() {
        let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        dateTextField.resignFirstResponder()
    }
    
    @objc
    func cancelTapped() {
        dateTextField.resignFirstResponder()
    }
}

// MARK: - Swift UI compatibility
// This exposes the LegacyViewController to SwiftUI
struct LegacyTextDateToolbarContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LegacyTextDateToolbarViewController {
        return LegacyTextDateToolbarViewController()
    }
    
    func updateUIViewController(_ uiViewController: LegacyTextDateToolbarViewController, context: Context) {
        
    }
}
