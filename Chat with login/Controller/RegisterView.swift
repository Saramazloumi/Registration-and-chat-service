

import UIKit
import CoreData

class RegisterView: UIView {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    
    func registeration() -> Bool {
        
        if validateFields() {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return true}
            let manageContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult> (entityName: "Users")
            request.predicate = NSPredicate(format: "username = %@", userNameTextField.text!)
            do{
                let result = try manageContext.fetch(request)
                if result.count > 0 {
                    statusLabel.text = "Username is exist!"
                    return false
                }
            }catch{
                print("Error in fetching data!", error.localizedDescription)
                return false
            }
                let user = Users(context: manageContext)
                user.firstname = firstNameTextField.text
                user.lastname = lastNameTextField.text
                user.username = userNameTextField.text
                user.password = passwordTextField.text
            
            do{
                try manageContext.save()
                statusLabel.text = "\(userNameTextField.text!) has successfully registered!"
                firstNameTextField.text = ""
                lastNameTextField.text = ""
                userNameTextField.text = ""
                passwordTextField.text = ""
                confirmTextField.text = ""
                return true
            }catch{
                print("Something wrong in registering user!", error.localizedDescription)
                return false
            }
        }else{
            statusLabel.text = "Something went wrong, try again!"
            return false
        }
    }
    
    
    
    


    func validateFields() -> Bool{
        if firstNameTextField.text == "" {
            statusLabel.text = "Enter your first name!"
            return false
        }else if lastNameTextField.text == "" {
            statusLabel.text = "Enter your last name!"
            return false
        }else if userNameTextField.text == "" {
            statusLabel.text = "Choose a username!"
            return false
        }else if passwordTextField.text == "" {
            statusLabel.text = "Choose your password"
            return false
        }else if confirmTextField.text == "" {
            statusLabel.text = " Confirm your password"
            return false
        }else if passwordTextField.text != confirmTextField.text {
            statusLabel.text = "Pass word not matched!"
            return false
        }
        return true
    }

}
