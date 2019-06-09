
import UIKit
import CoreData

class LoginView: UIView {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    func login() -> Bool {
        if validateFields() {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return true}
            let manageContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult> (entityName: "Users")
            request.predicate = NSPredicate(format: "username = %@", usernameTextField.text!)
            
            do{
                let result = try manageContext.fetch(request)
                if result.count > 0 {
                    let user = result[0] as! Users
                    if user.password == passwordTextField.text {
                        statusLabel.text = "Successfully logged in"
                        return true
                    }else{
                        statusLabel.text = "Wrong password!"
                        return false
                    }
                }else{
                    statusLabel.text = "\(usernameTextField.text!) is not exist!"
                    return false
                }
            }catch{
                print("Error in fetching data", error.localizedDescription)
                return false
            }
        }
        return false        
    }
    
    
    
    


    func validateFields() -> Bool {
        
        if usernameTextField.text == "" {
            statusLabel.text = "Enter your username!"
            return false
        }else if passwordTextField.text == "" {
            statusLabel.text = "Enter your password!"
            return false
        }
        return true
    }

}
