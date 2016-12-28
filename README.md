# TouchIdDemo
A demo project that use touch ID on iPhone

Below is the most important part of the codes for Touch ID authentication.

        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Touch ID") { (success, error) in
            
                if success {
                    print ("User has authenticated")
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondController", sender: nil)
                    }
                } else {
                    if let error = error {
                        print (error)
                    } else {
                        print ("Did not authenticate")
                    }
                }
            }
        }
        
1. In the above, .deviceOwnerAuthenticationWithBiometrics actually means LAPolicy.deviceOwnerAuthenticationWithBiometrics.
2. The use of DispatchQueue.main.async is to speed up the action of performSegue. Without this trick, it can take more than ten seconds for the second view controller to show up.
