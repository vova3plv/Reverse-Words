import UIKit

class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textToReverse: UITextField!
    @IBOutlet weak var textToIgnore: UITextField!
    @IBOutlet weak var reversedWords: UILabel!
    @IBOutlet weak var underline: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let reverse = ReverseRules()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targets()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard let text = reversedWords.text, text.isEmpty else { return clear() }
        guard let words = textToReverse.text, !words.isEmpty else { return }
        let ignoreSymbols = textToIgnore.text
        
        if textToIgnore.isHidden {
            reversedWords.text = reverse.reverseWords(words, with: reverse.alphabeticRule)
        } else if ignoreSymbols != nil {
            reversedWords.text = reverse.reverseWords(words, with: reverse.customRule, ignoreSymbols!)
        } else {
            reversedWords.text = reverse.reverseWords(words, with: reverse.noRules)
        }
        
        if textToReverse.hasText {
            reverseButton.setTitle("Clear", for: .normal)
        }
    }
    
    func clear() {
        reversedWords.text = ""
        textToReverse.text = ""
        textToIgnore.text = ""
        reverseButton.setTitle("Reverse", for: .normal)
        reverseButton.tintColor = .systemCyan
    }
    
    func targets() {
        textToReverse.addTarget(self, action: #selector(editingBegan), for: .editingDidBegin)
        textToReverse.addTarget(self, action: #selector(editingChange), for: .editingChanged)
        textToReverse.addTarget(self, action: #selector(editingEnd), for: .editingDidEnd)
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    @objc func editingChange(_ textField: UITextField) {
        underline.backgroundColor = .blue
        reverseButton.tintColor = .blue
    }
    
    @objc func editingBegan(_ textField: UITextField) {
        underline.backgroundColor = .blue
    }
    
    @objc func editingEnd(_ textField: UITextField) {
        underline.backgroundColor = .opaqueSeparator
        
    }
    
    @objc func valueChanged(_ segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            textToIgnore.isHidden = true
        } else if segment.selectedSegmentIndex == 1 {
            textToIgnore.isHidden = false
        }
        clear()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }    
}




