# PTDPickerViewController

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/PTDPickerViewController.svg?style=flat)](http://cocoapods.org/pods/PTDPickerViewController)
[![License](https://img.shields.io/cocoapods/l/PTDPickerViewController.svg?style=flat)](http://cocoapods.org/pods/PTDPickerViewController)
[![Platform](https://img.shields.io/cocoapods/p/PTDPickerViewController.svg?style=flat)](http://cocoapods.org/pods/PTDPickerViewController)


PTDPickerViewController can implement the screen composed of UIPickerView, Cancel, and Enter button with simple code.  
PTDPickerViewControllerはピッカー画面とキャンセル、決定の2つのボタンを表示させる画面をシンプルなコードで実装できます。  

![sample image](https://raw.githubusercontent.com/pontake-dev/PTDPickerViewController/image/PTDPickerViewController_screenshot_001.png)

## Description

It has the following functions.
- An array of Strings to display on the picker.  
ピッカーに表示させる文字列の配列を指定できます。

- Can set display language of cancellation and decision button.  
キャンセルボタンと決定ボタンの表示文言を指定できます。

- You can specify an index to check picker by default when displaying the screen.  
デフォルトでピッカーのアイテムを選択済みにするindexの指定ができます。

-  You can detect that you tapped the dialog button with a closure.  
  ダイアログのボタンをタップした事をクロージャで取得できます。

- Support portrait and landscape.  
ポートレート、ランドスケープの画面向きに対応しています。

## Example Usages

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
## Installation

### CocoaPods

Add to `Podfile`:

```
Pod 'PTDPickerViewController'
```

### Carthage

Add to `Cartfile`:

```
github "pontake-dev/PTDPickerViewController"
```

## License

MIT
