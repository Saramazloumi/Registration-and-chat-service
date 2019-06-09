
import UIKit

class ViewController: UIViewController {
    
    var registerView: RegisterView!
    var loginView: LoginView!
    
    var userData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func registerButton(sender: UIButton){
        if registerView.registeration(){
        let chatViewController = storyboard!.instantiateViewController(withIdentifier: "chat")
        present(chatViewController, animated: true, completion: nil)
        }else{
            registerView.statusLabel.text = "Something went wrong, Try again later!"
        }
    }
    
    @objc func loginButton(sender: UIButton){
        if loginView.login(){
        let chatViewController = storyboard!.instantiateViewController(withIdentifier: "chat")
        present(chatViewController, animated: true, completion: nil)
        }else{
            loginView.statusLabel.text = "Something went wrong, Try again later!"
        }
    }
    
    @IBAction func connectingBtnTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            registerView = Bundle.main.loadNibNamed("register", owner: self, options:nil)?.first as? RegisterView
            registerView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            registerView.frame = CGRect(x: 0, y: 150, width: self.view.frame.width, height: 350)
            registerView.registerBtn.addTarget(self, action: #selector(registerButton(sender:)), for: .touchUpInside)
            self.view.addSubview(registerView)
        } else if sender.tag == 2 {
            loginView = Bundle.main.loadNibNamed("login", owner: self, options: nil)?.first as? LoginView
            loginView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            loginView.frame = CGRect(x: 0, y: 150, width: self.view.frame.width, height: 350)
            loginView.loginBtn.addTarget(self, action: #selector(loginButton(sender:)), for: .touchUpInside)
            self.view.addSubview(loginView)
        }
        userData.set(true, forKey: "Tapped")
        userData.synchronize()
    }
}

