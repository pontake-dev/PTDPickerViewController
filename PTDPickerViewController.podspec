Pod::Spec.new do |s|
  s.name         = "PTDPickerViewController"
  s.version      = "1.0.0"
  s.summary      = "PTDPickerViewController can implement the screen composed of UIPickerView, Cancel, and Enter button with simple code."
  s.description  = <<-DESC
  PTDPickerViewController can implement the screen composed of UIPickerView, Cancel, and Enter button with simple code.

  Example Usages

  ```swift
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
  ```
                   DESC
  s.homepage     = "https://github.com/pontake-dev/PTDPickerViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "pontake-dev" => "pontake.dev@gmail.com" }
  s.platform     = :ios, "9.0"
  s.swift_version = "4.0"
  s.source       = { :git => "https://github.com/pontake-dev/PTDPickerViewController.git", :tag => "#{s.version}" }
  s.source_files  = "PTDPickerViewController/**/*.{swift}"
end
