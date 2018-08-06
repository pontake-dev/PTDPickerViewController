//
//  ViewController.swift
//  Demo
//
//  Created by pontake-dev on 2018/08/03.
//  Copyright © 2018年 pontake-dev. All rights reserved.
//

import UIKit
import PTDPickerViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showPickerButtonTapped(_ sender: UIButton) {
        //create picker view model
        let pickerItems: [String] = ["one","two","three","fore"]
        let initialSelectedIndex = 2
        let cancelButtonTitleString = "cancel"
        let doneButtonTitleString = "done"
        let pickerViewModel = PTDPickerViewModel.init(items: pickerItems,
                                                      currentSelectedIndex: initialSelectedIndex,
                                                      cancelButtonTitleString: cancelButtonTitleString,
                                                      doneButtonTitleString: doneButtonTitleString)

        //show picker
        PTDPickerViewController.create().show(viewModel: pickerViewModel) { (selectedIndex) in
            guard let selectedIndex = selectedIndex else {
                print("cancel button tapped")
                return
            }

            print("selected index \(selectedIndex)")
        }
    }

}
