import Foundation

class RegistrationController {
    
    // MARK: - Properties
    var registrationData: [String: Any] = [:]
    
    // MARK: - Methods
    
    // Validate registration data
    func validateRegistrationData(username: String?, fullName: String?, phone: String?, email: String?, password: String?, gender: Int?) -> Bool {
        guard let username = username, !username.isEmpty,
              let fullName = fullName, !fullName.isEmpty,
              let phone = phone, !phone.isEmpty,
              let email = email, !email.isEmpty,
              let password = password, !password.isEmpty,
              let gender = gender else {
                  return false
        }
        registrationData = [
            "username": username,
            "last_name": fullName,
            "email": email,
            "phone": phone,
            "sex": gender,
            "password": password
        ]
        return true
    }
    
    // Send registration data to API
    func registerUser(completion: @escaping (Bool, String?) -> Void) {
        guard let url = URL(string: "https://yourapi.com/api/registration") else {
            completion(false, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: registrationData, options: [])
            request.httpBody = jsonData
        } catch {
            completion(false, "Error serializing data: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false, "Error in registration request: \(error.localizedDescription)")
                return
            }
            
            // Check response status here (e.g., HTTP status code)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(true, nil)
            } else {
                completion(false, "Registration failed. Please try again.")
            }
        }
        task.resume()
    }
    
    // Validate login data
    func validateLoginData(email: String?, password: String?) -> Bool {
        guard let email = email, !email.isEmpty,
              let password = password, !password.isEmpty else {
                  return false
        }
        return true
    }
    
    // Send login data to API
    func loginUser(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        let loginData: [String: String] = [
            "email": email,
            "password": password
        ]
        
        guard let url = URL(string: "https://yourapi.com/api/auth") else {
            completion(false, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: loginData, options: [])
            request.httpBody = jsonData
        } catch {
            completion(false, "Error serializing data: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false, "Error in login request: \(error.localizedDescription)")
                return
            }
            
            // Check response status here (e.g., HTTP status code)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(true, nil)
            } else {
                completion(false, "Login failed. Please check your credentials.")
            }
        }
        task.resume()
    }
}

