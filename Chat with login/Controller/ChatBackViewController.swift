
import UIKit

class ChatBackViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textTextField: UITextField!
    
    var message: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = message
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendBack" {
            guard let chatViewController = segue.destination as? ChatViewController else{return}
            chatViewController.getMessage = textTextField.text
        }
    }


}
