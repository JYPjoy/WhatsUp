//
//  LoginView.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async {
        do {
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            // go to the main screen
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Form{
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            HStack {
                Spacer()
                Button("Login"){
                    Task{
                        await login()
                    }
                }.disabled(!isFormValid)
                
                Button("Register"){
                    
                }.buttonStyle(.borderless)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
