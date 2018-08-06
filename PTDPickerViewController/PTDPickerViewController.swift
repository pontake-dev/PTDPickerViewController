//
//  PTDPickerViewController.swift
//  PTDPickerViewController
//
//  Created by pontake-dev on 2017/12/31.
//  Copyright © 2017年 pontake-dev. All rights reserved.
//

import UIKit

/// ViewModel for picker selection screen display.
public struct PTDPickerViewModel {
    var items: [String]
    var currentSelectedIndex: Int
    var cancelButtonTitleString: String
    var doneButtonTitleString: String

    public init (items: [String], currentSelectedIndex: Int, cancelButtonTitleString: String, doneButtonTitleString: String) {
        self.items = items
        self.currentSelectedIndex = currentSelectedIndex
        self.cancelButtonTitleString = cancelButtonTitleString
        self.doneButtonTitleString = doneButtonTitleString
    }
}

public class PTDPickerViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    @IBOutlet weak var controllView: UIView!
    @IBOutlet weak var controllViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var controllViewHeightConstraint: NSLayoutConstraint!

    var window: UIWindow?
    var viewModel: PTDPickerViewModel?
    /// Closure to notify picker selection
    private var selectedClosure: ((_ selectedIndex: Int?) -> Void)?

    public static func create() -> PTDPickerViewController {
        let bundle = Bundle(for: PTDPickerViewController.self)
        let vc = UIStoryboard(name: "PTDPickerViewController", bundle: bundle).instantiateInitialViewController() as! PTDPickerViewController
        return vc
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        //Set pickerView to be hidden at the bottom of the screen.
        self.controllViewBottomConstraint.constant = 0
        self.controllViewBottomConstraint.constant -= self.controllViewHeightConstraint.constant
    }

    public func show(viewModel: PTDPickerViewModel, completion: @escaping ((_ result: Int?) -> Void)) {
        //Create a window and display it there.
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        window?.backgroundColor = UIColor.clear
        window?.rootViewController = self
        window?.makeKeyAndVisible()

        self.viewModel = viewModel
        self.selectedClosure = completion

        self.cancelBarButton.title = viewModel.cancelButtonTitleString
        self.doneBarButton.title = viewModel.doneButtonTitleString
        self.pickerView.reloadAllComponents()
        self.pickerView.selectRow(viewModel.currentSelectedIndex, inComponent: 0, animated: false)

        self.view.layoutIfNeeded()
        self.controllViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (done) in

        })
    }

    private func hide() {
        self.view.layoutIfNeeded()
        self.controllViewBottomConstraint.constant -= self.controllViewHeightConstraint.constant
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (done) in
            //Show original window
            UIApplication.shared.delegate?.window??.makeKeyAndVisible()
            self.window?.rootViewController = nil
            self.window = nil
        })
    }

    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
        guard let selectedClosure = selectedClosure else {
            return
        }

        var selectedIndex: Int?
        if sender.isEqual(doneBarButton) {
            selectedIndex = pickerView.selectedRow(inComponent: 0)
        }
        selectedClosure(selectedIndex)
        hide()
    }
}

//MARK: UIPickerViewDelegate, UIPickerViewDataSource -
extension PTDPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.items.count ?? 0
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.items[row]
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
}
