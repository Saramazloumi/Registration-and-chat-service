

import UIKit

class ChatViewController: UIViewController {
  
    
    
    @IBOutlet weak var getLabel: UILabel!
    @IBOutlet weak var messageTrxtField: UITextField!
    
    var getMessage: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        getLabel.text = getMessage
    }
    
    @IBAction func signOutTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let demoViewController = storyBoard.instantiateViewController(withIdentifier: "demo")
        present(demoViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "send" {
            guard let chatBackControllerView = segue.destination as? ChatBackViewController else{return}
            chatBackControllerView.message = messageTrxtField.text
        }
    }

}
